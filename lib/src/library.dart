abstract class FlutterLibrary {
  String get name;

  List<String> get widgets;

  Map<String, Function> get classes;

  Map<String, Function> get functions;

  Map<String, Object?> get constants;

  Map<String, Map<String, Object? Function()>> get statics;

  Map<String, List<Enum>> get enums;

  Map<String, Object?> get all => {
        ...classes,
        ...functions,
        ...constants,
        for (var key in statics.keys)
          for (var key2 in statics[key]!.keys)
            '$key.$key2': statics[key]![key2],
      };

  Object? operator [](String key) => all[key];
}
