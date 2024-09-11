import '../flutter_sdk_function_apply.dart';
import 'library.dart';

class FlutterSdkFunctionApply {
  final String name;
  final Map<int, dynamic> positionalArguments;
  final Map<String, dynamic> namedArguments;
  final Map<String, Function> methodHandlers;
  final String? staticTarget;

  FlutterSdkFunctionApply(
    this.name, {
    this.positionalArguments = const {},
    this.namedArguments = const {},
    this.methodHandlers = const {},
  }) : staticTarget = null;

  FlutterSdkFunctionApply.static(
    this.name,
    this.staticTarget, {
    this.methodHandlers = const {},
  })  : positionalArguments = const {},
        namedArguments = const {};

  List<dynamic> get positionalArgumentsList {
    return [
      for (var i = 0; i < positionalArguments.length; i++)
        positionalArguments[i]
    ];
  }

  Map<String, Object?> toJson() {
    Object? serialize(dynamic value) {
      if (value is FlutterSdkFunctionApply) {
        return value.toJson();
      }
      if (value is Function) {
        return {
          '@type': 'Function',
        };
      }
      if (value is Enum) {
        return {
          '@type': value.toString().split('.').first,
          '@target': value.name,
        };
      }
      return value;
    }

    return {
      '@type': name,
      if (staticTarget != null) '@static': staticTarget,
      '@args': {
        for (var i = 0; i < positionalArguments.length; i++)
          i.toString(): serialize(positionalArguments[i]),
        for (var key in namedArguments.keys)
          key: serialize(namedArguments[key]),
      },
    };
  }

  factory FlutterSdkFunctionApply.fromJson(
    Map<String, Object?> json, {
    bool recursive = true,
    Map<String, Function> methodHandlers = const {},
  }) {
    final name = json['@type'] as String;
    final args = Map.from(json['@args'] as Map? ?? {}).cast<String, Object?>();
    // Check for static
    if (json['@static'] is String) {
      final target = json['@static'] as String;
      return FlutterSdkFunctionApply.static(
        name,
        target,
        methodHandlers: methodHandlers,
      );
    }
    final data = _getArgs(
      args,
      recursive,
      methodHandlers,
    );
    return FlutterSdkFunctionApply(
      name,
      positionalArguments: data.positionalArgs,
      namedArguments: data.namedArgs,
      methodHandlers: methodHandlers,
    );
  }

  static ({
    Map<int, dynamic> positionalArgs,
    Map<String, dynamic> namedArgs,
  }) _getArgs(
    Map<String, dynamic> args,
    bool recursive,
    Map<String, Function> methodHandlers,
  ) {
    final positionalArgs = <int, dynamic>{};
    final namedArgs = <String, dynamic>{};

    // Positional arguments are numbered from 0 to n
    // Named arguments are strings
    for (final arg in args.keys) {
      final key = int.tryParse(arg);
      if (key != null) {
        positionalArgs[key] = _parseObject(
          args[arg],
          recursive,
          methodHandlers,
        );
      } else {
        namedArgs[arg] = _parseObject(
          args[arg],
          recursive,
          methodHandlers,
        );
      }
    }

    return (
      positionalArgs: positionalArgs,
      namedArgs: namedArgs,
    );
  }

  static Object? _parseObject(
    Object? obj,
    bool recursive,
    Map<String, Function> methodHandlers,
  ) {
    if (obj is FlutterSdkFunctionApply) {
      return obj();
    }
    if (obj is Map<String, Object?>) {
      if (obj['@type'] is String) {
        final type = obj['@type'] as String;
        // Check for function
        if (type == 'Function') {
          if (obj['@target'] is String) {
            final target = obj['@target'] as String;
            final handler = methodHandlers[target];
            if (handler == null) {
              throw Exception('Function handler for $target not found');
            }
            return handler;
          }
        }
        return _parseObject(
          FlutterSdkFunctionApply.fromJson(
            obj,
            recursive: recursive,
            methodHandlers: methodHandlers,
          ),
          recursive,
          methodHandlers,
        );
      }
    }
    return obj;
  }

  static List<FlutterLibrary> libraries = [...flutterLibraries];
  static bool useLibraryPrefix = false;

  dynamic call() {
    Function? callable;
    if (useLibraryPrefix) {
      final [alias, widgetName] = name.split('.');
      final lib = libraries.firstWhere((e) => e.name == alias);
      final value =
          lib[staticTarget != null ? '$widgetName.$staticTarget' : widgetName];
      if (value is Function) {
        callable = value;
      }
    } else {
      for (final lib in libraries) {
        final value = lib[staticTarget != null ? '$name.$staticTarget' : name];
        if (value is Function) {
          callable = value;
          break;
        }
      }
    }
    if (callable == null) {
      throw Exception('Function $name not found');
    }
    return Function.apply(
      callable,
      [...positionalArgumentsList],
      {for (var key in namedArguments.keys) Symbol(key): namedArguments[key]},
    );
  }
}
