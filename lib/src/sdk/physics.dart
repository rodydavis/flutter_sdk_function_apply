import 'package:flutter/physics.dart' as lib;

import '../library.dart';

class PhysicsLibrary extends FlutterLibrary {
  @override
  String get name => 'physics';

  @override
  final List<String> widgets = [
  ];

  @override
  final Map<String, Function> classes = {
    'BoundedFrictionSimulation': lib.BoundedFrictionSimulation.new,
    'ClampedSimulation': lib.ClampedSimulation.new,
    'FrictionSimulation': lib.FrictionSimulation.new,
    'FrictionSimulation.through': lib.FrictionSimulation.through.call,
    'GravitySimulation': lib.GravitySimulation.new,
    'ScrollSpringSimulation': lib.ScrollSpringSimulation.new,
    'SpringDescription': lib.SpringDescription.new,
    'SpringDescription.withDampingRatio': lib.SpringDescription.withDampingRatio.call,
    'SpringSimulation': lib.SpringSimulation.new,
    'Tolerance': lib.Tolerance.new,
  };

  @override
  final Map<String, Function> functions = {
    'nearEqual': lib.nearEqual.call,
    'nearZero': lib.nearZero.call,
  };

  @override
  final Map<String, Object?> constants = {
  };

  @override
  final Map<String, List<Enum>> enums = {
    'SpringType': lib.SpringType.values,
  };
 
  @override
  final Map<String, Map<String, Object? Function()>> statics = {
    'Tolerance': {
      'defaultTolerance': () => lib.Tolerance.defaultTolerance,
    },
  };
}
