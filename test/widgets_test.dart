import 'package:flutter/widgets.dart';
import 'package:flutter_sdk_function_apply/flutter_sdk_function_apply.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('widgets', () {
    test('Text', () {
      final text = FlutterSdkFunctionApply.fromJson({
        '@type': 'Text',
        '@args': {
          '0': 'Hello, World!',
        },
      });
      expect(text(), isA<Text>());

      final textRich = FlutterSdkFunctionApply.fromJson({
        '@type': 'Text.rich',
        '@args': {
          '0': {
            '@type': 'TextSpan',
            '@args': {
              'text': 'Hello, World!',
            },
          },
        },
      });
      expect(textRich(), isA<Text>());
    });

    test('Center', () {
      final center = FlutterSdkFunctionApply.fromJson({
        '@type': 'Center',
        '@args': {
          'child': {
            '@type': 'Text',
            '@args': {
              '0': 'Hello, World!',
            },
          },
        },
      });
      expect(center(), isA<Center>());
    });

    test('BoxConstraints', () {
      final boxConstraints = FlutterSdkFunctionApply.fromJson({
        '@type': 'BoxConstraints',
        '@args': {
          'minWidth': 100.0,
          'minHeight': 100.0,
        },
      });
      expect(boxConstraints(), isA<BoxConstraints>());

      final boxConstraintsExpand = FlutterSdkFunctionApply.fromJson({
        '@type': 'BoxConstraints.expand',
        '@args': {},
      });
      expect(boxConstraintsExpand(), isA<BoxConstraints>());
    });
  });
}
