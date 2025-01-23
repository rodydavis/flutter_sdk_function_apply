// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

Future<void> main(List<String> args) async {
  final ctx = FlutterContext(
    '/Users/rodydavis/Developer/flutter_sdk_function_apply/third_party/flutter/packages/flutter',
  );
  await ctx(args);
}

class FlutterContext {
  final String flutterPackage;
  late final Directory flutterDirectory = Directory('$flutterPackage/lib/src');
  // late final _files = flutterDirectory
  //     .listSync(recursive: true)
  //     .whereType<File>()
  //     .where((file) => file.path.endsWith('.dart'))
  //     .map((file) => file.path)
  //     .toList();
  late final _libs = flutterDirectory
      .listSync()
      .whereType<Directory>()
      .map((dir) => dir.path)
      .toList();
  FlutterContext(this.flutterPackage);

  late final libraries = <String, LibraryVisitor>{};

  Future<void> call([List<String> libs = const []]) async {
    for (final item in _libs) {
      final name = item.split('/').last;
      if (libs.isNotEmpty && !libs.contains(name)) {
        continue;
      }
      final ctx = LibraryVisitor();
      libraries[item] = ctx;
      final libFiles = Directory(item)
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .map((file) => file.path)
          .toList();
      late final collection = AnalysisContextCollection(
        includedPaths: libFiles,
      );
      await _analyze(collection, libFiles, ctx);
      print((
        name: name,
        classes: ctx.classes.length,
        methods: ctx.methods.length,
        variables: ctx.variables.length,
      ));
      final json = ctx.toJson();
      final file = File('./debug/$name.json');
      const encoder = JsonEncoder.withIndent('  ');
      await file.writeAsString(encoder.convert(json));
    }
  }

  Future<void> _analyze(
    AnalysisContextCollection collection,
    List<String> includedPaths,
    LibraryVisitor ctx,
  ) async {
    for (AnalysisContext context in collection.contexts) {
      for (String path in context.contextRoot.analyzedFiles()) {
        await _analyzeFile(context, path, ctx);
      }
    }
  }

  Future<void> _analyzeFile(
    AnalysisContext context,
    String path,
    LibraryVisitor ctx,
  ) async {
    AnalysisSession session = context.currentSession;
    var result = await session.getResolvedUnit(path);
    if (result is ResolvedUnitResult) {
      CompilationUnit unit = result.unit;
      ctx.visitCompilationUnit(unit);
    }
  }
}

// void printMembers(CompilationUnit unit) {
//   for (CompilationUnitMember unitMember in unit.declarations) {
//     if (unitMember is ClassDeclaration) {
//       print(unitMember.name.lexeme);
//       for (ClassMember classMember in unitMember.members) {
//         if (classMember is MethodDeclaration) {
//           print('  method:${classMember.name.lexeme}');
//         } else if (classMember is FieldDeclaration) {
//           for (VariableDeclaration field in classMember.fields.variables) {
//             print('  field:${field.name.lexeme}');
//           }
//         } else if (classMember is ConstructorDeclaration) {
//           if (classMember.name == null) {
//             print('  constructor:${unitMember.name.lexeme}');
//           } else {
//             print(
//                 '  constructor:${unitMember.name.lexeme}.${classMember.name!.lexeme}');
//           }
//         }
//       }
//     }
//   }
// }

class ClassInfo extends RecursiveAstVisitor<void> {
  final unnamedConstructors = <Constructor>{};
  final namedConstructors = <Constructor>{};
  final Map<String, dynamic> meta = {};

  Set<Constructor> get constructors {
    return {...unnamedConstructors, ...namedConstructors};
  }

  final methods = <({
    String name,
    TypeInfo returnType,
    MethodType type,
    bool isStatic,
  })>{};

  final variables = <({
    String name,
    TypeInfo returnType,
    bool isStatic,
  })>{};

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    meta['name'] = node.name.lexeme;
    meta['isAbstract'] = node.abstractKeyword != null;
    meta['isMixin'] = node.mixinKeyword != null;
    for (final member in node.members) {
      if (member is MethodDeclaration) {
        methods.add((
          name: member.name.lexeme,
          returnType: getType(member.returnType),
          type: member.isGetter
              ? MethodType.getter
              : member.isSetter
                  ? MethodType.setter
                  : MethodType.method,
          isStatic: member.isStatic,
        ));
      } else if (member is FieldDeclaration) {
        for (final field in member.fields.variables) {
          variables.add((
            name: field.name.lexeme,
            returnType: getType(field.declaredElement),
            isStatic: member.isStatic,
          ));
        }
      } else if (member is ConstructorDeclaration) {
        final positionalArgs = <Arg>[];
        final namedArgs = <Arg>[];
        for (final parameter in member.parameters.parameters) {
          final arg = (
            name: parameter.name!.lexeme.toString(),
            type: getType(parameter),
            isRequired: parameter.isRequired,
            defaultValue: parameter.declaredElement?.defaultValueCode,
          );
          if (parameter.isNamed) {
            namedArgs.add(arg);
          } else if (parameter.isPositional) {
            positionalArgs.add(arg);
          }
        }
        if (member.name == null) {
          unnamedConstructors.add((
            name: member.returnType.name,
            positionalArguments: positionalArgs,
            namedArguments: namedArgs,
          ));
        } else {
          namedConstructors.add((
            name: '${member.returnType.name}.${member.name!}',
            positionalArguments: positionalArgs,
            namedArguments: namedArgs,
          ));
        }
      }
    }
    super.visitClassDeclaration(node);
  }
}

class LibraryVisitor extends RecursiveAstVisitor<void> {
  LibraryVisitor();

  final classes = <ClassInfo>[];

  final methods = <({
    String name,
    TypeInfo returnType,
    MethodType type,
    bool isStatic,
  })>{};

  final variables = <({
    String name,
    TypeInfo returnType,
    bool isStatic,
  })>{};

  final enums = <({
    String name,
    List<String> values,
  })>{};

  Map<String, dynamic> toJson() {
    return {
      'classes': [
        for (final item in classes)
          {
            ...item.meta,
            'constructors': [
              for (final constructor in item.constructors)
                {
                  'name': constructor.name,
                  'positionalArguments': [
                    for (final arg in constructor.positionalArguments)
                      {
                        'name': arg.name,
                        'type': arg.type.toJson(),
                        'isRequired': arg.isRequired,
                        'defaultValue': arg.defaultValue,
                      },
                  ],
                  'namedArguments': [
                    for (final arg in constructor.namedArguments)
                      {
                        'name': arg.name,
                        'type': arg.type.toJson(),
                        'isRequired': arg.isRequired,
                        'defaultValue': arg.defaultValue,
                      },
                  ],
                },
            ],
            'methods': [
              for (final method in item.methods)
                {
                  'name': method.name,
                  'type': method.type.name,
                  'return': method.returnType.toJson(),
                  'static': method.isStatic,
                },
            ],
            'variables': [
              for (final variable in item.variables)
                {
                  'name': variable.name,
                  'return': variable.returnType.toJson(),
                  'static': variable.isStatic,
                },
            ],
          }
      ],
      'methods': [
        for (final method in methods)
          {
            'name': method.name,
            'type': method.type.name,
            'return': method.returnType.toJson(),
          },
      ],
      'variables': [
        for (final variable in variables)
          {
            'name': variable.name,
            'return': variable.returnType.toJson(),
          },
      ],
      'enums': [
        for (final item in enums)
          {
            'name': item.name,
            'values': item.values,
          },
      ],
    };
  }

  @override
  void visitEnumDeclaration(EnumDeclaration node) {
    enums.add((
      name: node.name.lexeme,
      values: [
        for (final constant in node.constants) constant.name.lexeme,
      ],
    ));
    super.visitEnumDeclaration(node);
  }

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    final classInfo = ClassInfo();
    classInfo.visitClassDeclaration(node);
    classes.add(classInfo);
    super.visitClassDeclaration(node);
  }

  @override
  void visitFunctionDeclaration(FunctionDeclaration node) {
    if (node is! FunctionDeclarationStatement) {
      methods.add((
        name: node.name.lexeme,
        returnType: node.isSetter
            ? TypeInfo(CoreType.$void, false, '', {})
            : getType(node.returnType),
        type: node.isGetter
            ? MethodType.getter
            : node.isSetter
                ? MethodType.setter
                : MethodType.method,
        isStatic: false,
      ));
    }
    super.visitFunctionDeclaration(node);
  }

  @override
  void visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
    for (final variable in node.variables.variables) {
      variables.add((
        name: variable.name.lexeme,
        returnType: getType(variable.declaredElement),
        isStatic: false,
      ));
    }
    super.visitTopLevelVariableDeclaration(node);
  }
}

typedef Constructor = ({
  String name,
  List<Arg> positionalArguments,
  List<Arg> namedArguments,
});

typedef Arg = ({
  String name,
  TypeInfo type,
  bool isRequired,
  String? defaultValue,
});

enum MethodType {
  method,
  getter,
  setter,
}

TypeInfo getType(Object? obj) {
  CoreType coreType = CoreType.$dynamic;
  bool isOptional = false;
  Map<String, dynamic> meta = {};
  if (obj is TypeAnnotation) {
    final dartType = obj.type;
    isOptional = obj.question != null;
    if (dartType != null) {
      (coreType, meta) = TypeInfo.fromDartType(dartType);
    }
  } else if (obj is DefaultFormalParameter) {
    final dartType = obj.parameter.declaredElement?.type;
    isOptional = obj.parameter.declaredElement?.isOptional ?? false;
    if (dartType != null) {
      (coreType, meta) = TypeInfo.fromDartType(dartType);
    } else {
      final typeFinder = TypeFinder(obj.parameter.declaredElement!.name);
      final value = typeFinder.visitCompilationUnit(
        obj.root as CompilationUnit,
      );
      if (value != null) return value;
    }
  } else if (obj is NamedType) {
    final dartType = obj.type;
    isOptional = obj.question != null;
    if (dartType != null) {
      (coreType, meta) = TypeInfo.fromDartType(dartType);
    }
  } else if (obj is VariableElement) {
    final dartType = obj.type;
    (coreType, meta) = TypeInfo.fromDartType(dartType);
  } else if (obj is FieldFormalParameter) {
    final dartType = obj.type?.type;
    isOptional = obj.question != null;
    if (dartType != null) {
      (coreType, meta) = TypeInfo.fromDartType(dartType);
    } else {
      final typeFinder = TypeFinder(obj.name.lexeme);
      final value = typeFinder.visitCompilationUnit(
        obj.root as CompilationUnit,
      );
      if (value != null) return value;
    }
  } else if (obj is SimpleFormalParameter) {
    final dartType = obj.type?.type;
    isOptional = obj.isOptional;
    if (dartType != null) {
      (coreType, meta) = TypeInfo.fromDartType(dartType);
    }
  } else if (obj is SuperFormalParameter) {
    final dartType = obj.type?.type;
    isOptional = obj.question != null;
    if (dartType != null) {
      (coreType, meta) = TypeInfo.fromDartType(dartType);
    }
  } else if (obj is FormalParameter) {
    final dartType = obj.declaredElement?.type;
    isOptional = obj.declaredElement?.isOptional ?? false;
    if (dartType != null) {
      (coreType, meta) = TypeInfo.fromDartType(dartType);
    } else {
      final typeFinder = TypeFinder(obj.declaredElement!.name);
      final value = typeFinder.visitCompilationUnit(
        obj.root as CompilationUnit,
      );
      if (value != null) return value;
    }
  }
  if (coreType == CoreType.$dynamic) {
    final str = obj.toString();
    coreType = TypeInfo.fromString(str);
    if (coreType == CoreType.$dynamic) {
      print('Unknown type: ${obj.runtimeType}, $str');
    }
  }
  return TypeInfo(coreType, isOptional, '', meta);
}

enum CoreType {
  $dynamic,
  $void,
  $int,
  $double,
  $num,
  $enum,
  $String,
  $bool,
  $List,
  $Map,
  $Set,
  $Object,
  $Function,
  $class,
}

class TypeInfo {
  final CoreType type;
  final bool isOptional;
  final String raw;
  final Map<String, dynamic> meta;
  TypeInfo(this.type, this.isOptional, this.raw, this.meta);

  static (CoreType, Map<String, dynamic>) fromDartType(DartType type) {
    final meta = <String, dynamic>{};
    if (type.isDartCoreInt) {
      return (CoreType.$int, meta);
    } else if (type.isDartCoreDouble) {
      return (CoreType.$double, meta);
    } else if (type.isDartCoreNum) {
      return (CoreType.$num, meta);
    } else if (type.isDartCoreString) {
      return (CoreType.$String, meta);
    } else if (type.isDartCoreBool) {
      return (CoreType.$bool, meta);
    } else if (type.isDartCoreList) {
      return (CoreType.$List, meta);
    } else if (type.isDartCoreMap) {
      return (CoreType.$Map, meta);
    } else if (type.isDartCoreSet) {
      return (CoreType.$Set, meta);
    } else if (type.isDartCoreObject) {
      return (CoreType.$Object, meta);
    } else if (type.isDartCoreFunction) {
      return (CoreType.$Function, meta);
    } else if (type.isDartCoreEnum) {
      return (CoreType.$enum, meta);
    }
    if (type is FunctionType) {
      meta['return'] = {
        'type': type.returnType.toString(),
      };
      meta['positional'] = [
        for (final param in type.parameters.where((e) => e.isPositional))
          param.toJson(),
      ];
      meta['named'] = [
        for (final param in type.parameters.where((e) => e.isNamed))
          param.toJson(),
      ];
      return (CoreType.$Function, meta);
    }
    if (type is InterfaceType) {
      meta['name'] = type.getDisplayString();
      meta['methods'] = [
        for (final method in type.methods) method.toJson(),
      ];
      meta['constructors'] = [
        for (final item in type.constructors) item.toJson(),
      ];
      meta['typeArguments'] = [
        for (final item in type.typeArguments) item.toString(),
      ];
      meta['allSupertypes'] = [
        for (final item in type.allSupertypes) item.getDisplayString(),
      ];
      return (CoreType.$class, meta);
    }
    return (CoreType.$dynamic, meta);
  }

  static CoreType fromString(String str) {
    switch (str) {
      case 'dynamic':
        return CoreType.$dynamic;
      case 'void':
        return CoreType.$void;
      case 'int':
        return CoreType.$int;
      case 'double':
        return CoreType.$double;
      case 'num':
        return CoreType.$num;
      case 'String':
        return CoreType.$String;
      case 'bool':
        return CoreType.$bool;
      case 'List':
        return CoreType.$List;
      case 'Map':
        return CoreType.$Map;
      case 'Set':
        return CoreType.$Set;
      case 'Object':
        return CoreType.$Object;
      case 'Function':
        return CoreType.$Function;
      case 'Enum':
        return CoreType.$enum;
      case 'Class':
        return CoreType.$class;
      default:
        return CoreType.$dynamic;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'type': switch (type) {
        CoreType.$dynamic => 'dynamic',
        CoreType.$void => 'void',
        CoreType.$int => 'int',
        CoreType.$double => 'double',
        CoreType.$num => 'num',
        CoreType.$String => 'String',
        CoreType.$bool => 'bool',
        CoreType.$List => 'List',
        CoreType.$Map => 'Map',
        CoreType.$Set => 'Set',
        CoreType.$Object => 'Object',
        CoreType.$Function => 'Function',
        CoreType.$enum => 'Enum',
        CoreType.$class => 'Class',
      },
      'optional': isOptional,
      'raw': raw,
      ...meta,
    };
  }

  @override
  String toString() {
    return 'TypeInfo($type, $isOptional, $raw)';
  }
}

class TypeFinder extends RecursiveAstVisitor<TypeInfo?> {
  final String targetName;
  TypeFinder(this.targetName);

  @override
  TypeInfo? visitCompilationUnit(CompilationUnit node) {
    for (final declaration in node.declarations) {
      final type = declaration.accept(this);
      if (type != null) {
        return type;
      }
    }
    return super.visitCompilationUnit(node);
  }

  @override
  TypeInfo? visitClassDeclaration(ClassDeclaration node) {
    for (final member in node.members) {
      final type = member.accept(this);
      if (type != null) {
        return type;
      }
    }
    return super.visitClassDeclaration(node);
  }

  @override
  TypeInfo? visitFieldDeclaration(FieldDeclaration node) {
    for (final field in node.fields.variables) {
      if (field.name.lexeme == targetName) {
        final declared = field.declaredElement?.type;
        final type = node.fields.type?.type;
        // print((
        //   "field",
        //   field.name.lexeme,
        //   (declared.runtimeType, declared.toString()),
        //   (type.runtimeType, type.toString()),
        // ));
        if (declared != null) {
          final (dartType, meta) = TypeInfo.fromDartType(declared);
          final optional = node.fields.type?.question != null;
          return TypeInfo(dartType, optional, declared.toString(), meta);
        }
        if (type != null) {
          final (dartType, meta) = TypeInfo.fromDartType(type);
          final optional = node.fields.type?.question != null;
          return TypeInfo(dartType, optional, type.toString(), meta);
        }
        return TypeInfo(CoreType.$dynamic, false, 'dynamic', {});
      }
    }
    return super.visitFieldDeclaration(node);
  }
}

// class ClassInfoVisitor extends RecursiveAstVisitor<void> {
//   final fieldTypes = <String, TypeInfo>{};
//   final constructorTypes = <String, Map<String, TypeInfo>>{};

//   @override
//   void visitClassDeclaration(ClassDeclaration node) {
//     for (final member in node.members) {
//       if (member is FieldDeclaration) {
//         for (final field in member.fields.variables) {
//           final type = field.declaredElement?.type;
//           if (type != null) {
//             final coreType = TypeInfo.fromDartType(type);
//             final optional = member.fields.type?.question != null;
//             fieldTypes[field.name.lexeme] = TypeInfo(
//               coreType,
//               optional,
//               type.toString(),
//             );
//           }
//         }
//       }
//       if (member is ConstructorDeclaration) {
//         final name = member.name?.lexeme ?? '';

//         final positionalArgs = <String, TypeInfo>{};
//         final namedArgs = <String, TypeInfo>{};
//         for (final parameter in member.parameters.parameters) {
//           final type = parameter.declaredElement?.type;
//           if (type != null) {
//             final coreType = TypeInfo.fromDartType(type);
//             final optional = parameter.isRequiredNamed;
//             if (parameter.isNamed) {
//               namedArgs[parameter.lexeme] = TypeInfo(
//                 coreType,
//                 optional,
//                 type.toString(),
//               );
//             } else if (parameter.isPositional) {
//               positionalArgs[parameter.identifier.lexeme] = TypeInfo(
//                 coreType,
//                 optional,
//                 type.toString(),
//               );
//             }
//           }
//         }
//         constructorTypes[member.name!.name] = {
//           'positional': positionalArgs,
//           'named': namedArgs,
//         };
//       }
//     }
//     super.visitClassDeclaration(node);
//   }
// }

extension on MethodElement {
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'return': returnType.toString(),
      'positional': [
        for (final param in parameters.where((e) => e.isPositional)) //
          param.toJson(),
      ],
      'named': [
        for (final param in parameters.where((e) => e.isNamed)) //
          param.toJson(),
      ],
    };
  }
}

extension on ParameterElement {
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.toString(),
      'optional': isOptional,
    };
  }
}

extension on ConstructorElement {
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'positional': [
        for (final param in parameters.where((e) => e.isPositional)) //
          param.toJson(),
      ],
      'named': [
        for (final param in parameters.where((e) => e.isNamed)) //
          param.toJson(),
      ],
    };
  }
}
