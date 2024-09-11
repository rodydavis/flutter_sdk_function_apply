import 'package:flutter/semantics.dart' as lib;

import '../library.dart';

class SemanticsLibrary extends FlutterLibrary {
  @override
  String get name => 'semantics';

  @override
  final List<String> widgets = [
  ];

  @override
  final Map<String, Function> classes = {
    'AnnounceSemanticsEvent': lib.AnnounceSemanticsEvent.new,
    'AttributedString': lib.AttributedString.new,
    'AttributedStringProperty': lib.AttributedStringProperty.new,
    'ChildSemanticsConfigurationsResultBuilder': lib.ChildSemanticsConfigurationsResultBuilder.new,
    'CustomSemanticsAction': lib.CustomSemanticsAction.new,
    'CustomSemanticsAction.overridingAction': lib.CustomSemanticsAction.overridingAction.call,
    'DiagnosticPropertiesBuilder': lib.DiagnosticPropertiesBuilder.new,
    'DiagnosticPropertiesBuilder.fromProperties': lib.DiagnosticPropertiesBuilder.fromProperties.call,
    'FocusSemanticEvent': lib.FocusSemanticEvent.new,
    'LocaleStringAttribute': lib.LocaleStringAttribute.new,
    'LongPressSemanticsEvent': lib.LongPressSemanticsEvent.new,
    'Matrix4': lib.Matrix4.new,
    'Matrix4.columns': lib.Matrix4.columns.call,
    'Matrix4.compose': lib.Matrix4.compose.call,
    'Matrix4.copy': lib.Matrix4.copy.call,
    'Matrix4.diagonal3': lib.Matrix4.diagonal3.call,
    'Matrix4.diagonal3Values': lib.Matrix4.diagonal3Values.call,
    'Matrix4.fromBuffer': lib.Matrix4.fromBuffer.call,
    'Matrix4.fromFloat64List': lib.Matrix4.fromFloat64List.call,
    'Matrix4.fromList': lib.Matrix4.fromList.call,
    'Matrix4.identity': lib.Matrix4.identity.call,
    'Matrix4.inverted': lib.Matrix4.inverted.call,
    'Matrix4.outer': lib.Matrix4.outer.call,
    'Matrix4.rotationX': lib.Matrix4.rotationX.call,
    'Matrix4.rotationY': lib.Matrix4.rotationY.call,
    'Matrix4.rotationZ': lib.Matrix4.rotationZ.call,
    'Matrix4.skew': lib.Matrix4.skew.call,
    'Matrix4.skewX': lib.Matrix4.skewX.call,
    'Matrix4.skewY': lib.Matrix4.skewY.call,
    'Matrix4.translation': lib.Matrix4.translation.call,
    'Matrix4.translationValues': lib.Matrix4.translationValues.call,
    'Matrix4.zero': lib.Matrix4.zero.call,
    'Offset': lib.Offset.new,
    'Offset.fromDirection': lib.Offset.fromDirection.call,
    'OrdinalSortKey': lib.OrdinalSortKey.new,
    'Rect.fromCenter': lib.Rect.fromCenter.call,
    'Rect.fromCircle': lib.Rect.fromCircle.call,
    'Rect.fromLTRB': lib.Rect.fromLTRB.call,
    'Rect.fromLTWH': lib.Rect.fromLTWH.call,
    'Rect.fromPoints': lib.Rect.fromPoints.call,
    'SemanticsActionEvent': lib.SemanticsActionEvent.new,
    'SemanticsConfiguration': lib.SemanticsConfiguration.new,
    'SemanticsData': lib.SemanticsData.new,
    'SemanticsHintOverrides': lib.SemanticsHintOverrides.new,
    'SemanticsNode': lib.SemanticsNode.new,
    'SemanticsNode.root': lib.SemanticsNode.root.call,
    'SemanticsOwner': lib.SemanticsOwner.new,
    'SemanticsProperties': lib.SemanticsProperties.new,
    'SemanticsTag': lib.SemanticsTag.new,
    'SpellOutStringAttribute': lib.SpellOutStringAttribute.new,
    'TapSemanticEvent': lib.TapSemanticEvent.new,
    'TextSelection': lib.TextSelection.new,
    'TextSelection.collapsed': lib.TextSelection.collapsed.call,
    'TextSelection.fromPosition': lib.TextSelection.fromPosition.call,
    'TextTreeConfiguration': lib.TextTreeConfiguration.new,
    'TooltipSemanticsEvent': lib.TooltipSemanticsEvent.new,
  };

  @override
  final Map<String, Function> functions = {
    'debugResetSemanticsIdCounter': lib.debugResetSemanticsIdCounter.call,
  };

  @override
  final Map<String, Object?> constants = {
  };

  @override
  final Map<String, List<Enum>> enums = {
    'Assertiveness': lib.Assertiveness.values,
    'DebugSemanticsDumpOrder': lib.DebugSemanticsDumpOrder.values,
    'DiagnosticLevel': lib.DiagnosticLevel.values,
    'DiagnosticsTreeStyle': lib.DiagnosticsTreeStyle.values,
    'TextDirection': lib.TextDirection.values,
  };
 
  @override
  final Map<String, Map<String, Object? Function()>> statics = {
    'Offset': {
      'infinite': () => lib.Offset.infinite,
      'zero': () => lib.Offset.zero,
    },
    'Rect': {
      'largest': () => lib.Rect.largest,
      'zero': () => lib.Rect.zero,
    },
    'SemanticsAction': {
      'copy': () => lib.SemanticsAction.copy,
      'customAction': () => lib.SemanticsAction.customAction,
      'cut': () => lib.SemanticsAction.cut,
      'decrease': () => lib.SemanticsAction.decrease,
      'didGainAccessibilityFocus': () => lib.SemanticsAction.didGainAccessibilityFocus,
      'didLoseAccessibilityFocus': () => lib.SemanticsAction.didLoseAccessibilityFocus,
      'dismiss': () => lib.SemanticsAction.dismiss,
      'focus': () => lib.SemanticsAction.focus,
      'increase': () => lib.SemanticsAction.increase,
      'longPress': () => lib.SemanticsAction.longPress,
      'moveCursorBackwardByCharacter': () => lib.SemanticsAction.moveCursorBackwardByCharacter,
      'moveCursorBackwardByWord': () => lib.SemanticsAction.moveCursorBackwardByWord,
      'moveCursorForwardByCharacter': () => lib.SemanticsAction.moveCursorForwardByCharacter,
      'moveCursorForwardByWord': () => lib.SemanticsAction.moveCursorForwardByWord,
      'paste': () => lib.SemanticsAction.paste,
      'scrollDown': () => lib.SemanticsAction.scrollDown,
      'scrollLeft': () => lib.SemanticsAction.scrollLeft,
      'scrollRight': () => lib.SemanticsAction.scrollRight,
      'scrollUp': () => lib.SemanticsAction.scrollUp,
      'setSelection': () => lib.SemanticsAction.setSelection,
      'setText': () => lib.SemanticsAction.setText,
      'showOnScreen': () => lib.SemanticsAction.showOnScreen,
      'tap': () => lib.SemanticsAction.tap,
      'values': () => lib.SemanticsAction.values,
    },
    'SemanticsFlag': {
      'hasCheckedState': () => lib.SemanticsFlag.hasCheckedState,
      'hasEnabledState': () => lib.SemanticsFlag.hasEnabledState,
      'hasExpandedState': () => lib.SemanticsFlag.hasExpandedState,
      'hasImplicitScrolling': () => lib.SemanticsFlag.hasImplicitScrolling,
      'hasToggledState': () => lib.SemanticsFlag.hasToggledState,
      'isButton': () => lib.SemanticsFlag.isButton,
      'isChecked': () => lib.SemanticsFlag.isChecked,
      'isCheckStateMixed': () => lib.SemanticsFlag.isCheckStateMixed,
      'isEnabled': () => lib.SemanticsFlag.isEnabled,
      'isExpanded': () => lib.SemanticsFlag.isExpanded,
      'isFocusable': () => lib.SemanticsFlag.isFocusable,
      'isFocused': () => lib.SemanticsFlag.isFocused,
      'isHeader': () => lib.SemanticsFlag.isHeader,
      'isHidden': () => lib.SemanticsFlag.isHidden,
      'isImage': () => lib.SemanticsFlag.isImage,
      'isInMutuallyExclusiveGroup': () => lib.SemanticsFlag.isInMutuallyExclusiveGroup,
      'isKeyboardKey': () => lib.SemanticsFlag.isKeyboardKey,
      'isLink': () => lib.SemanticsFlag.isLink,
      'isLiveRegion': () => lib.SemanticsFlag.isLiveRegion,
      'isMultiline': () => lib.SemanticsFlag.isMultiline,
      'isObscured': () => lib.SemanticsFlag.isObscured,
      'isReadOnly': () => lib.SemanticsFlag.isReadOnly,
      'isSelected': () => lib.SemanticsFlag.isSelected,
      'isSlider': () => lib.SemanticsFlag.isSlider,
      'isTextField': () => lib.SemanticsFlag.isTextField,
      'isToggled': () => lib.SemanticsFlag.isToggled,
      'namesRoute': () => lib.SemanticsFlag.namesRoute,
      'scopesRoute': () => lib.SemanticsFlag.scopesRoute,
      'values': () => lib.SemanticsFlag.values,
    },
  };
}
