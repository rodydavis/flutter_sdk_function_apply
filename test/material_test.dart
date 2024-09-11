import 'package:flutter/material.dart';
import 'package:flutter_sdk_function_apply/flutter_sdk_function_apply.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('material', () {
    // test('Text', () {
    //   final text = FlutterSdkFunctionApply.fromJson({
    //     '@type': 'Text',
    //     '@args': {
    //       '0': 'Hello, World!',
    //     },
    //   });
    //   expect(text(), isA<Text>());

    //   final textRich = FlutterSdkFunctionApply.fromJson({
    //     '@type': 'Text.rich',
    //     '@args': {
    //       '0': {
    //         '@type': 'TextSpan',
    //         '@args': {
    //           'text': 'Hello, World!',
    //         },
    //       },
    //     },
    //   });
    //   expect(textRich(), isA<Text>());
    // });

    test('IconButton', () {
      final center = FlutterSdkFunctionApply.fromJson(
        {
          '@type': 'IconButton',
          '@args': {
            'icon': {
              '@type': 'Icon',
              '@args': {
                '0': {
                  '@type': 'Icons',
                  '@static': 'clear',
                },
              },
            },
            'onPressed': {
              '@type': 'Function',
              '@target': 'empty',
            },
          },
        },
        methodHandlers: {
          'empty': () {},
        },
      );
      expect(center(), isA<IconButton>());
    });
  });
}
