import 'package:flutter/painting.dart' as lib;

import '../library.dart';

class PaintingLibrary extends FlutterLibrary {
  @override
  String get name => 'painting';

  @override
  final List<String> widgets = [
  ];

  @override
  final Map<String, Function> classes = {
    'Accumulator': lib.Accumulator.new,
    'Alignment': lib.Alignment.new,
    'AlignmentDirectional': lib.AlignmentDirectional.new,
    'AssetBundleImageKey': lib.AssetBundleImageKey.new,
    'AssetImage': lib.AssetImage.new,
    'AutomaticNotchedShape': lib.AutomaticNotchedShape.new,
    'BeveledRectangleBorder': lib.BeveledRectangleBorder.new,
    'Border': lib.Border.new,
    'Border.all': lib.Border.all.call,
    'Border.fromBorderSide': lib.Border.fromBorderSide.call,
    'Border.symmetric': lib.Border.symmetric.call,
    'BorderDirectional': lib.BorderDirectional.new,
    'BorderRadius.all': lib.BorderRadius.all.call,
    'BorderRadius.circular': lib.BorderRadius.circular.call,
    'BorderRadius.horizontal': lib.BorderRadius.horizontal.call,
    'BorderRadius.only': lib.BorderRadius.only.call,
    'BorderRadius.vertical': lib.BorderRadius.vertical.call,
    'BorderRadiusDirectional.all': lib.BorderRadiusDirectional.all.call,
    'BorderRadiusDirectional.circular': lib.BorderRadiusDirectional.circular.call,
    'BorderRadiusDirectional.horizontal': lib.BorderRadiusDirectional.horizontal.call,
    'BorderRadiusDirectional.only': lib.BorderRadiusDirectional.only.call,
    'BorderRadiusDirectional.vertical': lib.BorderRadiusDirectional.vertical.call,
    'BorderSide': lib.BorderSide.new,
    'BoxDecoration': lib.BoxDecoration.new,
    'BoxShadow': lib.BoxShadow.new,
    'CircleBorder': lib.CircleBorder.new,
    'CircularNotchedRectangle': lib.CircularNotchedRectangle.new,
    'Color': lib.Color.new,
    'Color.fromARGB': lib.Color.fromARGB.call,
    'Color.fromRGBO': lib.Color.fromRGBO.call,
    'ColorFilter.linearToSrgbGamma': lib.ColorFilter.linearToSrgbGamma.call,
    'ColorFilter.matrix': lib.ColorFilter.matrix.call,
    'ColorFilter.mode': lib.ColorFilter.mode.call,
    'ColorFilter.srgbToLinearGamma': lib.ColorFilter.srgbToLinearGamma.call,
    'ColorProperty': lib.ColorProperty.new,
    'ColorSwatch': lib.ColorSwatch.new,
    'ContinuousRectangleBorder': lib.ContinuousRectangleBorder.new,
    'DecorationImage': lib.DecorationImage.new,
    'EdgeInsets.all': lib.EdgeInsets.all.call,
    'EdgeInsets.fromLTRB': lib.EdgeInsets.fromLTRB.call,
    'EdgeInsets.fromViewPadding': lib.EdgeInsets.fromViewPadding.call,
    'EdgeInsets.fromWindowPadding': lib.EdgeInsets.fromWindowPadding.call,
    'EdgeInsets.only': lib.EdgeInsets.only.call,
    'EdgeInsets.symmetric': lib.EdgeInsets.symmetric.call,
    'EdgeInsetsDirectional.all': lib.EdgeInsetsDirectional.all.call,
    'EdgeInsetsDirectional.fromSTEB': lib.EdgeInsetsDirectional.fromSTEB.call,
    'EdgeInsetsDirectional.only': lib.EdgeInsetsDirectional.only.call,
    'EdgeInsetsDirectional.symmetric': lib.EdgeInsetsDirectional.symmetric.call,
    'ExactAssetImage': lib.ExactAssetImage.new,
    'FileImage': lib.FileImage.new,
    'FittedSizes': lib.FittedSizes.new,
    'FlutterLogoDecoration': lib.FlutterLogoDecoration.new,
    'FontFeature': lib.FontFeature.new,
    'FontFeature.alternative': lib.FontFeature.alternative.call,
    'FontFeature.alternativeFractions': lib.FontFeature.alternativeFractions.call,
    'FontFeature.caseSensitiveForms': lib.FontFeature.caseSensitiveForms.call,
    'FontFeature.characterVariant': lib.FontFeature.characterVariant.call,
    'FontFeature.contextualAlternates': lib.FontFeature.contextualAlternates.call,
    'FontFeature.denominator': lib.FontFeature.denominator.call,
    'FontFeature.disable': lib.FontFeature.disable.call,
    'FontFeature.enable': lib.FontFeature.enable.call,
    'FontFeature.fractions': lib.FontFeature.fractions.call,
    'FontFeature.historicalForms': lib.FontFeature.historicalForms.call,
    'FontFeature.historicalLigatures': lib.FontFeature.historicalLigatures.call,
    'FontFeature.liningFigures': lib.FontFeature.liningFigures.call,
    'FontFeature.localeAware': lib.FontFeature.localeAware.call,
    'FontFeature.notationalForms': lib.FontFeature.notationalForms.call,
    'FontFeature.numerators': lib.FontFeature.numerators.call,
    'FontFeature.oldstyleFigures': lib.FontFeature.oldstyleFigures.call,
    'FontFeature.ordinalForms': lib.FontFeature.ordinalForms.call,
    'FontFeature.proportionalFigures': lib.FontFeature.proportionalFigures.call,
    'FontFeature.randomize': lib.FontFeature.randomize.call,
    'FontFeature.scientificInferiors': lib.FontFeature.scientificInferiors.call,
    'FontFeature.slashedZero': lib.FontFeature.slashedZero.call,
    'FontFeature.stylisticAlternates': lib.FontFeature.stylisticAlternates.call,
    'FontFeature.stylisticSet': lib.FontFeature.stylisticSet.call,
    'FontFeature.subscripts': lib.FontFeature.subscripts.call,
    'FontFeature.superscripts': lib.FontFeature.superscripts.call,
    'FontFeature.swash': lib.FontFeature.swash.call,
    'FontFeature.tabularFigures': lib.FontFeature.tabularFigures.call,
    'FontVariation': lib.FontVariation.new,
    'FontVariation.italic': lib.FontVariation.italic.call,
    'FontVariation.opticalSize': lib.FontVariation.opticalSize.call,
    'FontVariation.slant': lib.FontVariation.slant.call,
    'FontVariation.weight': lib.FontVariation.weight.call,
    'FontVariation.width': lib.FontVariation.width.call,
    'FractionalOffset': lib.FractionalOffset.new,
    'FractionalOffset.fromOffsetAndRect': lib.FractionalOffset.fromOffsetAndRect.call,
    'FractionalOffset.fromOffsetAndSize': lib.FractionalOffset.fromOffsetAndSize.call,
    'GlyphInfo': lib.GlyphInfo.new,
    'GradientRotation': lib.GradientRotation.new,
    'HSLColor.fromAHSL': lib.HSLColor.fromAHSL.call,
    'HSLColor.fromColor': lib.HSLColor.fromColor.call,
    'HSVColor.fromAHSV': lib.HSVColor.fromAHSV.call,
    'HSVColor.fromColor': lib.HSVColor.fromColor.call,
    'ImageCache': lib.ImageCache.new,
    'ImageChunkEvent': lib.ImageChunkEvent.new,
    'ImageConfiguration': lib.ImageConfiguration.new,
    'ImageInfo': lib.ImageInfo.new,
    'ImageShader': lib.ImageShader.new,
    'ImageSizeInfo': lib.ImageSizeInfo.new,
    'ImageStream': lib.ImageStream.new,
    'ImageStreamListener': lib.ImageStreamListener.new,
    'InlineSpanSemanticsInformation': lib.InlineSpanSemanticsInformation.new,
    'LinearBorder': lib.LinearBorder.new,
    'LinearBorder.bottom': lib.LinearBorder.bottom.call,
    'LinearBorder.end': lib.LinearBorder.end.call,
    'LinearBorder.start': lib.LinearBorder.start.call,
    'LinearBorder.top': lib.LinearBorder.top.call,
    'LinearBorderEdge': lib.LinearBorderEdge.new,
    'LinearGradient': lib.LinearGradient.new,
    'LineMetrics': lib.LineMetrics.new,
    'Locale': lib.Locale.new,
    'Locale.fromSubtags': lib.Locale.fromSubtags.call,
    'MaskFilter.blur': lib.MaskFilter.blur.call,
    'MemoryImage': lib.MemoryImage.new,
    'MultiFrameImageStreamCompleter': lib.MultiFrameImageStreamCompleter.new,
    'Offset': lib.Offset.new,
    'Offset.fromDirection': lib.Offset.fromDirection.call,
    'OneFrameImageStreamCompleter': lib.OneFrameImageStreamCompleter.new,
    'OvalBorder': lib.OvalBorder.new,
    'Paint': lib.Paint.new,
    'Paint.from': lib.Paint.from.call,
    'PlaceholderDimensions': lib.PlaceholderDimensions.new,
    'RadialGradient': lib.RadialGradient.new,
    'Radius.circular': lib.Radius.circular.call,
    'Radius.elliptical': lib.Radius.elliptical.call,
    'Rect.fromCenter': lib.Rect.fromCenter.call,
    'Rect.fromCircle': lib.Rect.fromCircle.call,
    'Rect.fromLTRB': lib.Rect.fromLTRB.call,
    'Rect.fromLTWH': lib.Rect.fromLTWH.call,
    'Rect.fromPoints': lib.Rect.fromPoints.call,
    'ResizeImage': lib.ResizeImage.new,
    'RoundedRectangleBorder': lib.RoundedRectangleBorder.new,
    'RRect.fromLTRBAndCorners': lib.RRect.fromLTRBAndCorners.call,
    'RRect.fromLTRBR': lib.RRect.fromLTRBR.call,
    'RRect.fromLTRBXY': lib.RRect.fromLTRBXY.call,
    'RRect.fromRectAndCorners': lib.RRect.fromRectAndCorners.call,
    'RRect.fromRectAndRadius': lib.RRect.fromRectAndRadius.call,
    'RRect.fromRectXY': lib.RRect.fromRectXY.call,
    'RSTransform': lib.RSTransform.new,
    'RSTransform.fromComponents': lib.RSTransform.fromComponents.call,
    'Shadow': lib.Shadow.new,
    'ShapeDecoration': lib.ShapeDecoration.new,
    'ShapeDecoration.fromBoxDecoration': lib.ShapeDecoration.fromBoxDecoration.call,
    'Size': lib.Size.new,
    'Size.copy': lib.Size.copy.call,
    'Size.fromHeight': lib.Size.fromHeight.call,
    'Size.fromRadius': lib.Size.fromRadius.call,
    'Size.fromWidth': lib.Size.fromWidth.call,
    'Size.square': lib.Size.square.call,
    'StadiumBorder': lib.StadiumBorder.new,
    'StarBorder': lib.StarBorder.new,
    'StarBorder.polygon': lib.StarBorder.polygon.call,
    'StrutStyle': lib.StrutStyle.new,
    'StrutStyle.fromTextStyle': lib.StrutStyle.fromTextStyle.call,
    'SweepGradient': lib.SweepGradient.new,
    'TextAlignVertical': lib.TextAlignVertical.new,
    'TextBox.fromLTRBD': lib.TextBox.fromLTRBD.call,
    'TextDecoration.combine': lib.TextDecoration.combine.call,
    'TextHeightBehavior': lib.TextHeightBehavior.new,
    'TextPainter': lib.TextPainter.new,
    'TextPosition': lib.TextPosition.new,
    'TextRange': lib.TextRange.new,
    'TextRange.collapsed': lib.TextRange.collapsed.call,
    'TextSelection': lib.TextSelection.new,
    'TextSelection.collapsed': lib.TextSelection.collapsed.call,
    'TextSelection.fromPosition': lib.TextSelection.fromPosition.call,
    'TextSpan': lib.TextSpan.new,
    'TextStyle': lib.TextStyle.new,
    'TransformProperty': lib.TransformProperty.new,
  };

  @override
  final Map<String, Function> functions = {
    'applyBoxFit': lib.applyBoxFit.call,
    'axisDirectionIsReversed': lib.axisDirectionIsReversed.call,
    'axisDirectionToAxis': lib.axisDirectionToAxis.call,
    'combineSemanticsInfo': lib.combineSemanticsInfo.call,
    'debugAssertAllPaintingVarsUnset': lib.debugAssertAllPaintingVarsUnset.call,
    'debugDescribeTransform': lib.debugDescribeTransform.call,
    'debugFlushLastFrameImageSizeInfo': lib.debugFlushLastFrameImageSizeInfo.call,
    'decodeImageFromList': lib.decodeImageFromList.call,
    'flipAxis': lib.flipAxis.call,
    'flipAxisDirection': lib.flipAxisDirection.call,
    'hashList': lib.hashList.call,
    'hashValues': lib.hashValues.call,
    'lerpFontVariations': lib.lerpFontVariations.call,
    'paintBorder': lib.paintBorder.call,
    'paintImage': lib.paintImage.call,
    'paintZigZag': lib.paintZigZag.call,
    'positionDependentBox': lib.positionDependentBox.call,
    'textDirectionToAxisDirection': lib.textDirectionToAxisDirection.call,
  };

  @override
  final Map<String, Object?> constants = {
    'kDefaultFontSize': lib.kDefaultFontSize,
    'kTextHeightNone': lib.kTextHeightNone,
  };

  @override
  final Map<String, List<Enum>> enums = {
    'Axis': lib.Axis.values,
    'AxisDirection': lib.AxisDirection.values,
    'BlendMode': lib.BlendMode.values,
    'BlurStyle': lib.BlurStyle.values,
    'BorderStyle': lib.BorderStyle.values,
    'BoxFit': lib.BoxFit.values,
    'BoxShape': lib.BoxShape.values,
    'Clip': lib.Clip.values,
    'FilterQuality': lib.FilterQuality.values,
    'FlutterLogoStyle': lib.FlutterLogoStyle.values,
    'FontStyle': lib.FontStyle.values,
    'ImageRepeat': lib.ImageRepeat.values,
    'PaintingStyle': lib.PaintingStyle.values,
    'PathFillType': lib.PathFillType.values,
    'PathOperation': lib.PathOperation.values,
    'PlaceholderAlignment': lib.PlaceholderAlignment.values,
    'RenderComparison': lib.RenderComparison.values,
    'ResizeImagePolicy': lib.ResizeImagePolicy.values,
    'StrokeCap': lib.StrokeCap.values,
    'StrokeJoin': lib.StrokeJoin.values,
    'TextAffinity': lib.TextAffinity.values,
    'TextAlign': lib.TextAlign.values,
    'TextBaseline': lib.TextBaseline.values,
    'TextDecorationStyle': lib.TextDecorationStyle.values,
    'TextDirection': lib.TextDirection.values,
    'TextLeadingDistribution': lib.TextLeadingDistribution.values,
    'TextOverflow': lib.TextOverflow.values,
    'TextWidthBasis': lib.TextWidthBasis.values,
    'TileMode': lib.TileMode.values,
    'VertexMode': lib.VertexMode.values,
    'VerticalDirection': lib.VerticalDirection.values,
  };
 
  @override
  final Map<String, Map<String, Object? Function()>> statics = {
    'Alignment': {
      'bottomCenter': () => lib.Alignment.bottomCenter,
      'bottomLeft': () => lib.Alignment.bottomLeft,
      'bottomRight': () => lib.Alignment.bottomRight,
      'center': () => lib.Alignment.center,
      'centerLeft': () => lib.Alignment.centerLeft,
      'centerRight': () => lib.Alignment.centerRight,
      'topCenter': () => lib.Alignment.topCenter,
      'topLeft': () => lib.Alignment.topLeft,
      'topRight': () => lib.Alignment.topRight,
    },
    'AlignmentDirectional': {
      'bottomCenter': () => lib.AlignmentDirectional.bottomCenter,
      'bottomEnd': () => lib.AlignmentDirectional.bottomEnd,
      'bottomStart': () => lib.AlignmentDirectional.bottomStart,
      'center': () => lib.AlignmentDirectional.center,
      'centerEnd': () => lib.AlignmentDirectional.centerEnd,
      'centerStart': () => lib.AlignmentDirectional.centerStart,
      'topCenter': () => lib.AlignmentDirectional.topCenter,
      'topEnd': () => lib.AlignmentDirectional.topEnd,
      'topStart': () => lib.AlignmentDirectional.topStart,
    },
    'BorderRadius': {
      'zero': () => lib.BorderRadius.zero,
    },
    'BorderRadiusDirectional': {
      'zero': () => lib.BorderRadiusDirectional.zero,
    },
    'BorderSide': {
      'none': () => lib.BorderSide.none,
      'strokeAlignCenter': () => lib.BorderSide.strokeAlignCenter,
      'strokeAlignInside': () => lib.BorderSide.strokeAlignInside,
      'strokeAlignOutside': () => lib.BorderSide.strokeAlignOutside,
    },
    'EdgeInsets': {
      'zero': () => lib.EdgeInsets.zero,
    },
    'EdgeInsetsDirectional': {
      'zero': () => lib.EdgeInsetsDirectional.zero,
    },
    'EdgeInsetsGeometry': {
      'infinity': () => lib.EdgeInsetsGeometry.infinity,
    },
    'FontWeight': {
      'bold': () => lib.FontWeight.bold,
      'normal': () => lib.FontWeight.normal,
      'values': () => lib.FontWeight.values,
      'w100': () => lib.FontWeight.w100,
      'w200': () => lib.FontWeight.w200,
      'w300': () => lib.FontWeight.w300,
      'w400': () => lib.FontWeight.w400,
      'w500': () => lib.FontWeight.w500,
      'w600': () => lib.FontWeight.w600,
      'w700': () => lib.FontWeight.w700,
      'w800': () => lib.FontWeight.w800,
      'w900': () => lib.FontWeight.w900,
    },
    'FractionalOffset': {
      'bottomCenter': () => lib.FractionalOffset.bottomCenter,
      'bottomLeft': () => lib.FractionalOffset.bottomLeft,
      'bottomRight': () => lib.FractionalOffset.bottomRight,
      'center': () => lib.FractionalOffset.center,
      'centerLeft': () => lib.FractionalOffset.centerLeft,
      'centerRight': () => lib.FractionalOffset.centerRight,
      'topCenter': () => lib.FractionalOffset.topCenter,
      'topLeft': () => lib.FractionalOffset.topLeft,
      'topRight': () => lib.FractionalOffset.topRight,
    },
    'ImageConfiguration': {
      'empty': () => lib.ImageConfiguration.empty,
    },
    'InlineSpanSemanticsInformation': {
      'placeholder': () => lib.InlineSpanSemanticsInformation.placeholder,
    },
    'LinearBorder': {
      'none': () => lib.LinearBorder.none,
    },
    'Offset': {
      'infinite': () => lib.Offset.infinite,
      'zero': () => lib.Offset.zero,
    },
    'PlaceholderDimensions': {
      'empty': () => lib.PlaceholderDimensions.empty,
    },
    'PlaceholderSpan': {
      'placeholderCodeUnit': () => lib.PlaceholderSpan.placeholderCodeUnit,
    },
    'Radius': {
      'zero': () => lib.Radius.zero,
    },
    'Rect': {
      'largest': () => lib.Rect.largest,
      'zero': () => lib.Rect.zero,
    },
    'RRect': {
      'zero': () => lib.RRect.zero,
    },
    'Size': {
      'infinite': () => lib.Size.infinite,
      'zero': () => lib.Size.zero,
    },
    'StrutStyle': {
      'disabled': () => lib.StrutStyle.disabled,
    },
    'TextAlignVertical': {
      'bottom': () => lib.TextAlignVertical.bottom,
      'center': () => lib.TextAlignVertical.center,
      'top': () => lib.TextAlignVertical.top,
    },
    'TextDecoration': {
      'lineThrough': () => lib.TextDecoration.lineThrough,
      'none': () => lib.TextDecoration.none,
      'overline': () => lib.TextDecoration.overline,
      'underline': () => lib.TextDecoration.underline,
    },
    'TextRange': {
      'empty': () => lib.TextRange.empty,
    },
    'TextScaler': {
      'noScaling': () => lib.TextScaler.noScaling,
    },
  };
}