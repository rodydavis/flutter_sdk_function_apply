import 'package:flutter/animation.dart' as lib;

import '../library.dart';

class AnimationLibrary extends FlutterLibrary {
  @override
  String get name => 'animation';

  @override
  final List<String> widgets = [
  ];

  @override
  final Map<String, Function> classes = {
    'AlwaysStoppedAnimation': lib.AlwaysStoppedAnimation.new,
    'AnimationController': lib.AnimationController.new,
    'AnimationController.unbounded': lib.AnimationController.unbounded.call,
    'AnimationMax': lib.AnimationMax.new,
    'AnimationMean': lib.AnimationMean.new,
    'AnimationMin': lib.AnimationMin.new,
    'AnimationStyle': lib.AnimationStyle.new,
    'CatmullRomCurve': lib.CatmullRomCurve.new,
    'CatmullRomCurve.precompute': lib.CatmullRomCurve.precompute.call,
    'CatmullRomSpline': lib.CatmullRomSpline.new,
    'CatmullRomSpline.precompute': lib.CatmullRomSpline.precompute.call,
    'Color': lib.Color.new,
    'Color.fromARGB': lib.Color.fromARGB.call,
    'Color.fromRGBO': lib.Color.fromRGBO.call,
    'ColorTween': lib.ColorTween.new,
    'ConstantTween': lib.ConstantTween.new,
    'Cubic': lib.Cubic.new,
    'Curve2DSample': lib.Curve2DSample.new,
    'CurvedAnimation': lib.CurvedAnimation.new,
    'CurveTween': lib.CurveTween.new,
    'ElasticInCurve': lib.ElasticInCurve.new,
    'ElasticInOutCurve': lib.ElasticInOutCurve.new,
    'ElasticOutCurve': lib.ElasticOutCurve.new,
    'FlippedCurve': lib.FlippedCurve.new,
    'FlippedTweenSequence': lib.FlippedTweenSequence.new,
    'Interval': lib.Interval.new,
    'IntTween': lib.IntTween.new,
    'Offset': lib.Offset.new,
    'Offset.fromDirection': lib.Offset.fromDirection.call,
    'ProxyAnimation': lib.ProxyAnimation.new,
    'Rect.fromCenter': lib.Rect.fromCenter.call,
    'Rect.fromCircle': lib.Rect.fromCircle.call,
    'Rect.fromLTRB': lib.Rect.fromLTRB.call,
    'Rect.fromLTWH': lib.Rect.fromLTWH.call,
    'Rect.fromPoints': lib.Rect.fromPoints.call,
    'RectTween': lib.RectTween.new,
    'ReverseAnimation': lib.ReverseAnimation.new,
    'ReverseTween': lib.ReverseTween.new,
    'SawTooth': lib.SawTooth.new,
    'Size': lib.Size.new,
    'Size.copy': lib.Size.copy.call,
    'Size.fromHeight': lib.Size.fromHeight.call,
    'Size.fromRadius': lib.Size.fromRadius.call,
    'Size.fromWidth': lib.Size.fromWidth.call,
    'Size.square': lib.Size.square.call,
    'SizeTween': lib.SizeTween.new,
    'Split': lib.Split.new,
    'SpringDescription': lib.SpringDescription.new,
    'SpringDescription.withDampingRatio': lib.SpringDescription.withDampingRatio.call,
    'StepTween': lib.StepTween.new,
    'ThreePointCubic': lib.ThreePointCubic.new,
    'Threshold': lib.Threshold.new,
    'TickerFuture.complete': lib.TickerFuture.complete.call,
    'TrainHoppingAnimation': lib.TrainHoppingAnimation.new,
    'Tween': lib.Tween.new,
    'TweenSequence': lib.TweenSequence.new,
    'TweenSequenceItem': lib.TweenSequenceItem.new,
  };

  @override
  final Map<String, Function> functions = {
  };

  @override
  final Map<String, Object?> constants = {
    'kAlwaysCompleteAnimation': lib.kAlwaysCompleteAnimation,
    'kAlwaysDismissedAnimation': lib.kAlwaysDismissedAnimation,
  };

  @override
  final Map<String, List<Enum>> enums = {
    'AnimationBehavior': lib.AnimationBehavior.values,
    'AnimationStatus': lib.AnimationStatus.values,
  };
 
  @override
  final Map<String, Map<String, Object? Function()>> statics = {
    'AnimationStyle': {
      'noAnimation': () => lib.AnimationStyle.noAnimation,
    },
    'Curves': {
      'bounceIn': () => lib.Curves.bounceIn,
      'bounceInOut': () => lib.Curves.bounceInOut,
      'bounceOut': () => lib.Curves.bounceOut,
      'decelerate': () => lib.Curves.decelerate,
      'ease': () => lib.Curves.ease,
      'easeIn': () => lib.Curves.easeIn,
      'easeInBack': () => lib.Curves.easeInBack,
      'easeInCirc': () => lib.Curves.easeInCirc,
      'easeInCubic': () => lib.Curves.easeInCubic,
      'easeInExpo': () => lib.Curves.easeInExpo,
      'easeInOut': () => lib.Curves.easeInOut,
      'easeInOutBack': () => lib.Curves.easeInOutBack,
      'easeInOutCirc': () => lib.Curves.easeInOutCirc,
      'easeInOutCubic': () => lib.Curves.easeInOutCubic,
      'easeInOutCubicEmphasized': () => lib.Curves.easeInOutCubicEmphasized,
      'easeInOutExpo': () => lib.Curves.easeInOutExpo,
      'easeInOutQuad': () => lib.Curves.easeInOutQuad,
      'easeInOutQuart': () => lib.Curves.easeInOutQuart,
      'easeInOutQuint': () => lib.Curves.easeInOutQuint,
      'easeInOutSine': () => lib.Curves.easeInOutSine,
      'easeInQuad': () => lib.Curves.easeInQuad,
      'easeInQuart': () => lib.Curves.easeInQuart,
      'easeInQuint': () => lib.Curves.easeInQuint,
      'easeInSine': () => lib.Curves.easeInSine,
      'easeInToLinear': () => lib.Curves.easeInToLinear,
      'easeOut': () => lib.Curves.easeOut,
      'easeOutBack': () => lib.Curves.easeOutBack,
      'easeOutCirc': () => lib.Curves.easeOutCirc,
      'easeOutCubic': () => lib.Curves.easeOutCubic,
      'easeOutExpo': () => lib.Curves.easeOutExpo,
      'easeOutQuad': () => lib.Curves.easeOutQuad,
      'easeOutQuart': () => lib.Curves.easeOutQuart,
      'easeOutQuint': () => lib.Curves.easeOutQuint,
      'easeOutSine': () => lib.Curves.easeOutSine,
      'elasticIn': () => lib.Curves.elasticIn,
      'elasticInOut': () => lib.Curves.elasticInOut,
      'elasticOut': () => lib.Curves.elasticOut,
      'fastEaseInToSlowEaseOut': () => lib.Curves.fastEaseInToSlowEaseOut,
      'fastLinearToSlowEaseIn': () => lib.Curves.fastLinearToSlowEaseIn,
      'fastOutSlowIn': () => lib.Curves.fastOutSlowIn,
      'linear': () => lib.Curves.linear,
      'linearToEaseOut': () => lib.Curves.linearToEaseOut,
      'slowMiddle': () => lib.Curves.slowMiddle,
    },
    'Offset': {
      'infinite': () => lib.Offset.infinite,
      'zero': () => lib.Offset.zero,
    },
    'Rect': {
      'largest': () => lib.Rect.largest,
      'zero': () => lib.Rect.zero,
    },
    'Size': {
      'infinite': () => lib.Size.infinite,
      'zero': () => lib.Size.zero,
    },
  };
}
