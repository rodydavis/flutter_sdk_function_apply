import 'package:flutter/scheduler.dart' as lib;

import '../library.dart';

class SchedulerLibrary extends FlutterLibrary {
  @override
  String get name => 'scheduler';

  @override
  final List<String> widgets = [
  ];

  @override
  final Map<String, Function> classes = {
    'FrameTiming': lib.FrameTiming.new,
    'Ticker': lib.Ticker.new,
    'TickerFuture.complete': lib.TickerFuture.complete.call,
  };

  @override
  final Map<String, Function> functions = {
    'debugAssertAllSchedulerVarsUnset': lib.debugAssertAllSchedulerVarsUnset.call,
    'defaultSchedulingStrategy': lib.defaultSchedulingStrategy.call,
  };

  @override
  final Map<String, Object?> constants = {
  };

  @override
  final Map<String, List<Enum>> enums = {
    'AppLifecycleState': lib.AppLifecycleState.values,
    'SchedulerPhase': lib.SchedulerPhase.values,
    'SchedulerServiceExtensions': lib.SchedulerServiceExtensions.values,
  };
 
  @override
  final Map<String, Map<String, Object? Function()>> statics = {
    'Priority': {
      'animation': () => lib.Priority.animation,
      'idle': () => lib.Priority.idle,
      'kMaxOffset': () => lib.Priority.kMaxOffset,
      'touch': () => lib.Priority.touch,
    },
  };
}
