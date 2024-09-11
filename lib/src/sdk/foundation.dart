import 'package:flutter/foundation.dart' as lib;

import '../library.dart';

class FoundationLibrary extends FlutterLibrary {
  @override
  String get name => 'foundation';

  @override
  final List<String> widgets = [
  ];

  @override
  final Map<String, Function> classes = {
    'AbstractNode': lib.AbstractNode.new,
    'AggregatedTimedBlock': lib.AggregatedTimedBlock.new,
    'AggregatedTimings': lib.AggregatedTimings.new,
    'CachingIterable': lib.CachingIterable.new,
    'Category': lib.Category.new,
    'ChangeNotifier': lib.ChangeNotifier.new,
    'DiagnosticableNode': lib.DiagnosticableNode.new,
    'DiagnosticableTreeNode': lib.DiagnosticableTreeNode.new,
    'DiagnosticPropertiesBuilder': lib.DiagnosticPropertiesBuilder.new,
    'DiagnosticPropertiesBuilder.fromProperties': lib.DiagnosticPropertiesBuilder.fromProperties.call,
    'DiagnosticsBlock': lib.DiagnosticsBlock.new,
    'DiagnosticsProperty': lib.DiagnosticsProperty.new,
    'DiagnosticsProperty.lazy': lib.DiagnosticsProperty.lazy.call,
    'DiagnosticsStackTrace': lib.DiagnosticsStackTrace.new,
    'DiagnosticsStackTrace.singleFrame': lib.DiagnosticsStackTrace.singleFrame.call,
    'DocumentationIcon': lib.DocumentationIcon.new,
    'DoubleProperty': lib.DoubleProperty.new,
    'DoubleProperty.lazy': lib.DoubleProperty.lazy.call,
    'EnumProperty': lib.EnumProperty.new,
    'ErrorDescription': lib.ErrorDescription.new,
    'ErrorHint': lib.ErrorHint.new,
    'ErrorSpacer': lib.ErrorSpacer.new,
    'ErrorSummary': lib.ErrorSummary.new,
    'Factory': lib.Factory.new,
    'FlagProperty': lib.FlagProperty.new,
    'FlagsSummary': lib.FlagsSummary.new,
    'FlutterErrorDetails': lib.FlutterErrorDetails.new,
    'HashedObserverList': lib.HashedObserverList.new,
    'IntProperty': lib.IntProperty.new,
    'IterableProperty': lib.IterableProperty.new,
    'LicenseEntryWithLineBreaks': lib.LicenseEntryWithLineBreaks.new,
    'LicenseParagraph': lib.LicenseParagraph.new,
    'MessageProperty': lib.MessageProperty.new,
    'ObjectCreated': lib.ObjectCreated.new,
    'ObjectDisposed': lib.ObjectDisposed.new,
    'ObjectFlagProperty': lib.ObjectFlagProperty.new,
    'ObjectFlagProperty.has': lib.ObjectFlagProperty.has.call,
    'ObserverList': lib.ObserverList.new,
    'PartialStackFrame': lib.PartialStackFrame.new,
    'PercentProperty': lib.PercentProperty.new,
    'PersistentHashMap.empty': lib.PersistentHashMap.empty.call,
    'ReadBuffer': lib.ReadBuffer.new,
    'RepetitiveStackFrameFilter': lib.RepetitiveStackFrameFilter.new,
    'StackFrame': lib.StackFrame.new,
    'StringProperty': lib.StringProperty.new,
    'Summary': lib.Summary.new,
    'SynchronousFuture': lib.SynchronousFuture.new,
    'TextTreeConfiguration': lib.TextTreeConfiguration.new,
    'TextTreeRenderer': lib.TextTreeRenderer.new,
    'TimedBlock': lib.TimedBlock.new,
    'UniqueKey': lib.UniqueKey.new,
    'ValueKey': lib.ValueKey.new,
    'ValueNotifier': lib.ValueNotifier.new,
    'WriteBuffer': lib.WriteBuffer.new,
  };

  @override
  final Map<String, Function> functions = {
    'binarySearch': lib.binarySearch.call,
    'clampDouble': lib.clampDouble.call,
    'compute': lib.compute.call,
    'consolidateHttpClientResponseBytes': lib.consolidateHttpClientResponseBytes.call,
    'debugAssertAllFoundationVarsUnset': lib.debugAssertAllFoundationVarsUnset.call,
    'debugFormatDouble': lib.debugFormatDouble.call,
    'debugInstrumentAction': lib.debugInstrumentAction.call,
    'debugPrintStack': lib.debugPrintStack.call,
    'debugPrintSynchronously': lib.debugPrintSynchronously.call,
    'debugPrintThrottled': lib.debugPrintThrottled.call,
    'debugWordWrap': lib.debugWordWrap.call,
    'describeEnum': lib.describeEnum.call,
    'describeIdentity': lib.describeIdentity.call,
    'lerpDuration': lib.lerpDuration.call,
    'listEquals': lib.listEquals.call,
    'mapEquals': lib.mapEquals.call,
    'mergeSort': lib.mergeSort.call,
    'objectRuntimeType': lib.objectRuntimeType.call,
    'setEquals': lib.setEquals.call,
    'shortHash': lib.shortHash.call,
  };

  @override
  final Map<String, Object?> constants = {
    'factory': lib.factory,
    'immutable': lib.immutable,
    'kDebugMode': lib.kDebugMode,
    'kFlutterMemoryAllocationsEnabled': lib.kFlutterMemoryAllocationsEnabled,
    'kIsWasm': lib.kIsWasm,
    'kIsWeb': lib.kIsWeb,
    'kMaxUnsignedSMI': lib.kMaxUnsignedSMI,
    'kNoDefaultValue': lib.kNoDefaultValue,
    'kProfileMode': lib.kProfileMode,
    'kReleaseMode': lib.kReleaseMode,
    'mustCallSuper': lib.mustCallSuper,
    'nonVirtual': lib.nonVirtual,
    'optionalTypeArgs': lib.optionalTypeArgs,
    'precisionErrorTolerance': lib.precisionErrorTolerance,
    'protected': lib.protected,
    'required': lib.required,
    'visibleForOverriding': lib.visibleForOverriding,
    'visibleForTesting': lib.visibleForTesting,
  };

  @override
  final Map<String, List<Enum>> enums = {
    'Brightness': lib.Brightness.values,
    'DiagnosticLevel': lib.DiagnosticLevel.values,
    'DiagnosticsTreeStyle': lib.DiagnosticsTreeStyle.values,
    'FoundationServiceExtensions': lib.FoundationServiceExtensions.values,
    'TargetPlatform': lib.TargetPlatform.values,
  };
 
  @override
  final Map<String, Map<String, Object? Function()>> statics = {
    'BindingBase': {
      'debugZoneErrorsAreFatal': () => lib.BindingBase.debugZoneErrorsAreFatal,
    },
    'Endian': {
      'big': () => lib.Endian.big,
      'little': () => lib.Endian.little,
      'host': () => lib.Endian.host,
    },
    'Float32List': {
      'bytesPerElement': () => lib.Float32List.bytesPerElement,
    },
    'Float64List': {
      'bytesPerElement': () => lib.Float64List.bytesPerElement,
    },
    'FlutterErrorDetails': {
      'propertiesTransformers': () => lib.FlutterErrorDetails.propertiesTransformers,
    },
    'FlutterMemoryAllocations': {
      'instance': () => lib.FlutterMemoryAllocations.instance,
    },
    'FlutterTimeline': {
      'debugCollectionEnabled': () => lib.FlutterTimeline.debugCollectionEnabled,
      'now': () => lib.FlutterTimeline.now,
    },
    'Int32List': {
      'bytesPerElement': () => lib.Int32List.bytesPerElement,
    },
    'Int64List': {
      'bytesPerElement': () => lib.Int64List.bytesPerElement,
    },
    'LicenseParagraph': {
      'centeredIndent': () => lib.LicenseParagraph.centeredIndent,
    },
    'LicenseRegistry': {
      'licenses': () => lib.LicenseRegistry.licenses,
    },
    'PartialStackFrame': {
      'asynchronousSuspension': () => lib.PartialStackFrame.asynchronousSuspension,
    },
    'PlatformDispatcher': {
      'instance': () => lib.PlatformDispatcher.instance,
    },
    'StackFrame': {
      'asynchronousSuspension': () => lib.StackFrame.asynchronousSuspension,
      'stackOverFlowElision': () => lib.StackFrame.stackOverFlowElision,
    },
    'Uint8List': {
      'bytesPerElement': () => lib.Uint8List.bytesPerElement,
    },
    'Unicode': {
      'ALM': () => lib.Unicode.ALM,
      'FSI': () => lib.Unicode.FSI,
      'LRE': () => lib.Unicode.LRE,
      'LRI': () => lib.Unicode.LRI,
      'LRM': () => lib.Unicode.LRM,
      'LRO': () => lib.Unicode.LRO,
      'PDF': () => lib.Unicode.PDF,
      'PDI': () => lib.Unicode.PDI,
      'RLE': () => lib.Unicode.RLE,
      'RLI': () => lib.Unicode.RLI,
      'RLM': () => lib.Unicode.RLM,
      'RLO': () => lib.Unicode.RLO,
    },
  };
}
