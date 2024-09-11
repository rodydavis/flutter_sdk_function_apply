library flutter_sdk_function_apply;

export 'src/widget.dart';
export 'src/sdk/animation.dart';
export 'src/sdk/cupertino.dart';
export 'src/sdk/foundation.dart';
export 'src/sdk/gestures.dart';
export 'src/sdk/material.dart';
export 'src/sdk/painting.dart';
export 'src/sdk/physics.dart';
export 'src/sdk/rendering.dart';
export 'src/sdk/scheduler.dart';
export 'src/sdk/semantics.dart';
export 'src/sdk/services.dart';
export 'src/sdk/widgets.dart';

import 'src/library.dart';
import 'src/sdk/animation.dart';
import 'src/sdk/cupertino.dart';
import 'src/sdk/foundation.dart';
import 'src/sdk/gestures.dart';
import 'src/sdk/material.dart';
import 'src/sdk/painting.dart';
import 'src/sdk/physics.dart';
import 'src/sdk/rendering.dart';
import 'src/sdk/scheduler.dart';
import 'src/sdk/semantics.dart';
import 'src/sdk/services.dart';
import 'src/sdk/widgets.dart';

List<FlutterLibrary> flutterLibraries = [
  ServicesLibrary(),
  SchedulerLibrary(),
  SemanticsLibrary(),
  WidgetsLibrary(),
  AnimationLibrary(),
  CupertinoLibrary(),
  FoundationLibrary(),
  GesturesLibrary(),
  MaterialLibrary(),
  PaintingLibrary(),
  PhysicsLibrary(),
  RenderingLibrary(),
];
