// ignore_for_file: avoid_print, unused_element

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:mustache_template/mustache_template.dart';
import 'package:recase/recase.dart';
import 'package:sqlite3/sqlite3.dart';

void main(List<String> args) async {
  for (final arg in args) {
    final generator = LibraryGenerator(arg);
    generator.init();
    await generator.download();
    final file = File('lib/src/sdk/$arg.dart');
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    file.writeAsStringSync(generator.renderTemplate());
    generator.dispose();
  }
}

// TODO: OpenApi Schema
class LibraryGenerator {
  final String name;
  LibraryGenerator(this.name);

  late final db = sqlite3.open('./flutter-sdk.db');
  final client = RetryClient(http.Client());

  final classConstructors = <({
    String name,
    bool named,
    List<String> inheritance,
    List<String> features,
  })>[];
  final classesInfo = <({
    String name,
    List<String> inheritance,
    List<String> features,
    List<String> constants,
    List<String> statics,
  })>[];
  final functions = <String>[];
  final enums = <String>[];
  final mixins = <String>[];
  final extensions = <String>[];
  final constants = <String>[];
  final typedefs = <String>[];
  final exceptions = <String>[];

  void init() {
    db.execute('''
      CREATE TABLE IF NOT EXISTS libraries (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        url TEXT NOT NULL,
        html TEXT NOT NULL,
        created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        UNIQUE(url)
      );
    ''');
  }

  void dispose() {
    db.dispose();
  }

  static const _baseHref = 'https://api.flutter.dev/flutter';

  // Url to the flutter.dev documentation
  late final _uri = Uri.parse('$_baseHref/$name/$name-library.html');

  Future<String> _downloadHtml(Uri uri) async {
    final row = db.select('''
      SELECT html FROM libraries WHERE url = ?;
    ''', [uri.toString()]).firstOrNull;
    if (row != null) {
      return row['html'] as String;
    }
    final result = await client.get(uri).then((response) {
      if (response.statusCode == 200) {
        final str = response.body;
        db.execute('''
          INSERT INTO libraries (url, html) VALUES (?, ?)
          ON CONFLICT(url) DO UPDATE SET html = ?;
        ''', [uri.toString(), str, str]);
        return str;
      }
      return '';
    });
    await Future.delayed(const Duration(milliseconds: 10));
    return result;
  }

  Future<void> download() async {
    final mainHtml = await _downloadHtml(_uri);
    final mainDoc = parse(mainHtml);
    {
      // Classes
      var idx = 0;
      final items = mainDoc.querySelectorAll('#classes dt .name');
      for (final e in items) {
        final a = e.querySelector('a')!;
        final url = a.attributes['href'] as String;
        final className = a.text;
        // .signature
        // Download the class documentation
        final html = await _downloadHtml(Uri.parse('$_baseHref/$url'));
        final doc = parse(html);
        final targets = doc.querySelectorAll('#constructors .callable .name');

        // Find <dt>Inheritance</dt>
        final inheritanceEl = doc
            .querySelectorAll('.dl-horizontal dt')
            .firstWhereOrNull((e) => e.text == 'Inheritance');
        final inheritance = inheritanceEl == null
            ? <String>[]
            : inheritanceEl.nextElementSibling!
                .querySelectorAll('.clazz-relationships li a')
                .map((e) => e.text)
                .toList();
        final features =
            doc.querySelectorAll('a.feature').map((e) => e.text).toList();

        final constants = doc
            .querySelectorAll('#constants .constant .name')
            .map((e) => e.querySelector('a')!.text)
            .toList();

        final statics = doc
            .querySelectorAll('#static-properties .property .name')
            .map((e) => e.querySelector('a')!.text)
            .toList();

        classesInfo.add((
          name: className,
          inheritance: inheritance,
          features: features,
          constants: constants,
          statics: statics,
        ));

        for (final e in targets) {
          final a = e.querySelector('a')!;
          final label = a.text;
          final detailsUrl = Uri.parse('$_baseHref/${a.attributes['href']}');
          await _downloadHtml(detailsUrl);

          if (className != label) {
            // Named constructor
            classConstructors.add((
              name: label,
              named: true,
              inheritance: inheritance,
              features: features,
            ));
          } else {
            // Default constructor
            classConstructors.add((
              name: label,
              named: false,
              inheritance: inheritance,
              features: features,
            ));
          }
        }
        print('Downloaded ${idx + 1}/${items.length} classes');
        idx++;
      }
      {
        // Functions
        final items = mainDoc.querySelectorAll('#functions .callable .name');
        for (final e in items) {
          final a = e.querySelector('a')!;
          final label = a.text;
          functions.add(label);
          await _downloadHtml(Uri.parse('$_baseHref/${a.attributes['href']}'));
        }
      }
      {
        // Enums
        final items = mainDoc.querySelectorAll('#enums dt .name');
        for (final e in items) {
          final a = e.querySelector('a')!;
          final label = a.text;
          enums.add(label);
          await _downloadHtml(Uri.parse('$_baseHref/${a.attributes['href']}'));
        }
      }
      {
        // Mixins
        final items = mainDoc.querySelectorAll('#mixins dt .name');
        for (final e in items) {
          final a = e.querySelector('a')!;
          final label = a.text;
          mixins.add(label);
          await _downloadHtml(Uri.parse('$_baseHref/${a.attributes['href']}'));
        }
      }
      {
        // Extensions
        final items = mainDoc.querySelectorAll('#extensions dt .name');
        for (final e in items) {
          final a = e.querySelector('a')!;
          final label = a.text;
          extensions.add(label);
          await _downloadHtml(Uri.parse('$_baseHref/${a.attributes['href']}'));
        }
      }
      {
        // Constants
        final items = mainDoc.querySelectorAll('#constants .constant .name');
        for (final e in items) {
          final a = e.querySelector('a')!;
          final label = a.text;
          constants.add(label);
          await _downloadHtml(Uri.parse('$_baseHref/${a.attributes['href']}'));
        }
      }
      {
        // Typedefs
        final items = mainDoc.querySelectorAll('#typedefs .callable .name');
        for (final e in items) {
          final a = e.querySelector('a')!;
          final label = a.text;
          typedefs.add(label);
          await _downloadHtml(Uri.parse('$_baseHref/${a.attributes['href']}'));
        }
      }
      {
        // Exceptions
        final items = mainDoc.querySelectorAll('#exceptions dt .name');
        for (final e in items) {
          final a = e.querySelector('a')!;
          final label = a.text;
          exceptions.add(label);
          await _downloadHtml(Uri.parse('$_baseHref/${a.attributes['href']}'));
        }
      }
    }

    print('Classes: ${classesInfo.length}');
    print('Functions: ${functions.length}');
    print('Enums: ${enums.length}');
    print('Mixins: ${mixins.length}');
    print('Extensions: ${extensions.length}');
    print('Constants: ${constants.length}');
    print('Typedefs: ${typedefs.length}');
    print('Exceptions: ${exceptions.length}');
  }

  String renderTemplate() {
    final args = <String, dynamic>{...cases};
    args['name'] = name;
    args['classes'] = classConstructors
        .where((e) => !e.features.contains('abstract'))
        .map((e) => {'name': e.name, 'named': e.named})
        .toList();
    args['widgets'] = classConstructors
        .where((e) => !e.features.contains('abstract'))
        .where((e) => e.inheritance.contains('Widget'))
        .map((e) => e.name)
        .toList();
    args['functions'] = functions;
    args['constants'] = constants;
    args['enums'] = enums;
    final statics = <String, List<String>>{};
    for (final item in classesInfo) {
      for (final target in item.constants) {
        statics[item.name] ??= [];
        statics[item.name]!.add(target);
      }
      for (final target in item.statics) {
        statics[item.name] ??= [];
        statics[item.name]!.add(target);
      }
    }
    args['statics'] = [
      for (final item in statics.entries)
        {
          'name': item.key,
          'values': item.value.toSet().toList(),
        }
    ];
    final template = Template(
      _template,
      htmlEscapeValues: false,
    );
    return template.renderString(args);
  }
}

Map<String, Function> cases = <String, String Function(LambdaContext)>{
  "camel_case": (ctx) => ReCase(ctx.renderString()).camelCase,
  "snake_case": (ctx) => ReCase(ctx.renderString()).snakeCase,
  "pascal_case": (ctx) => ReCase(ctx.renderString()).pascalCase,
  "param_case": (ctx) => ReCase(ctx.renderString()).paramCase,
  "title_case": (ctx) => ReCase(ctx.renderString()).titleCase,
  "sentence_case": (ctx) => ReCase(ctx.renderString()).sentenceCase,
  "header_case": (ctx) => ReCase(ctx.renderString()).headerCase,
  "constant_case": (ctx) => ReCase(ctx.renderString()).constantCase,
  "path_case": (ctx) => ReCase(ctx.renderString()).pathCase,
  "dot_case": (ctx) => ReCase(ctx.renderString()).dotCase,
  "camelCase": (ctx) => ReCase(ctx.renderString()).camelCase,
  "snakeCase": (ctx) => ReCase(ctx.renderString()).snakeCase,
  "pascalCase": (ctx) => ReCase(ctx.renderString()).pascalCase,
  "paramCase": (ctx) => ReCase(ctx.renderString()).paramCase,
  "titleCase": (ctx) => ReCase(ctx.renderString()).titleCase,
  "sentenceCase": (ctx) => ReCase(ctx.renderString()).sentenceCase,
  "headerCase": (ctx) => ReCase(ctx.renderString()).headerCase,
  "constantCase": (ctx) => ReCase(ctx.renderString()).constantCase,
  "pathCase": (ctx) => ReCase(ctx.renderString()).pathCase,
  "dotCase": (ctx) => ReCase(ctx.renderString()).dotCase,
};

const _template = '''
import 'package:flutter/{{name}}.dart' as lib;

import '../library.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Library extends FlutterLibrary {
  @override
  String get name => '{{name}}';

  @override
  final List<String> widgets = [
    {{#widgets}}
    '{{.}}',
    {{/widgets}}
  ];

  @override
  final Map<String, Function> classes = {
    {{#classes}}
    {{#named}}
    '{{name}}': lib.{{name}}.call,
    {{/named}}
    {{^named}}
    '{{name}}': lib.{{name}}.new,
    {{/named}}
    {{/classes}}
  };

  @override
  final Map<String, Function> functions = {
    {{#functions}}
    '{{.}}': lib.{{.}}.call,
    {{/functions}}
  };

  @override
  final Map<String, Object?> constants = {
    {{#constants}}
    '{{.}}': lib.{{.}},
    {{/constants}}
  };

  @override
  final Map<String, List<Enum>> enums = {
    {{#enums}}
    '{{.}}': lib.{{.}}.values,
    {{/enums}}
  };
 
  @override
  final Map<String, Map<String, Object? Function()>> statics = {
    {{#statics}}
    '{{name}}': {
      {{#values}}
      '{{.}}': () => lib.{{name}}.{{.}},
      {{/values}}
    },
    {{/statics}}
  };
}
''';
