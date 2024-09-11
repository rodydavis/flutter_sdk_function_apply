import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sdk_function_apply/flutter_sdk_function_apply.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter SDK'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Widgets'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Widgets();
              }));
            },
          ),
          ListTile(
            title: const Text('Preview'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Preview();
              }));
            },
          ),
        ],
      ),
    );
  }
}

class Widgets extends StatelessWidget {
  const Widgets({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = flutterLibraries.expand((lib) => lib.widgets);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets'),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final key = entries.elementAt(index);
          return ListTile(
            title: Text(key),
          );
        },
      ),
    );
  }
}

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final controller = TextEditingController();
  static const encoder = JsonEncoder.withIndent(' ');

  void reset() {
    controller.clear();
  }

  void addExample(String example) {
    controller.text = example;
  }

  void addScaffoldWithHelloWorld() {
    controller.text = encoder.convert({
      '@type': 'Scaffold',
      '@args': {
        'appBar': {
          '@type': 'AppBar',
          '@args': {
            'automaticallyImplyLeading': false,
            'title': {
              '@type': 'Text',
              '@args': {
                '0': 'Hello, World!',
              },
            },
          },
        },
        'body': {
          '@type': 'Center',
          '@args': {
            'child': {
              '@type': 'FilledButton',
              '@args': {
                'child': {
                  '@type': 'Text',
                  '@args': {
                    '0': 'Click me!',
                  },
                },
                'onPressed': {
                  '@type': 'Function',
                  '@target': 'empty',
                },
              },
            },
          },
        },
      },
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: reset,
          ),
          IconButton(
            icon: const Icon(Icons.widgets),
            tooltip: 'Add example',
            onPressed: () {
              addScaffoldWithHelloWorld();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: TextField(
              controller: controller,
              expands: true,
              maxLines: null,
            ),
          ),
          Flexible(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                if (controller.text.trim().isEmpty) {
                  return const Center(
                    child: Text('Enter widget json'),
                  );
                }
                try {
                  final child = FlutterSdkFunctionApply.fromJson(
                    jsonDecode(controller.text),
                    methodHandlers: {
                      'empty': () {
                        final messenger = ScaffoldMessenger.of(context);
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text('Hello, World!'),
                          ),
                        );
                      },
                    },
                  );
                  return child();
                } catch (e) {
                  return Center(
                    child: Text('Error: $e'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
