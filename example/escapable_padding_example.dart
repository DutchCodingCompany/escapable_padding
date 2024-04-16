import 'package:escapable_padding/escapable_padding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Escapable Padding Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Escapable Padding Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            color: Colors.blue.shade100,
            width: 300,
            child: EscapablePadding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              flexChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('This is a text is affected by the padding provided'),
                  const SizedBox(height: 12),
                  const Escaped(
                    child: Text('However, this text is escaped and should be able to take full width here'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Below there will be a normal text button. You can see that its body is not escaped and thus text is indented.',
                  ),
                  const SizedBox(height: 12),
                  TextButton(onPressed: () {}, child: const Text('This is a button')),
                  const SizedBox(height: 12),
                  const Text(
                    'However we could escape a button to completely ignore the provided padding to this Escapeble Flex',
                  ),
                  const SizedBox(height: 12),
                  Escaped(
                    child: TextButton(onPressed: () {}, child: const Text('This is an escaped button')),
                  ),
                  const Text(
                    'And this way we could make sure we set the padding of the escaped text button to a value to align with the text',
                  ),
                  const SizedBox(height: 12),
                  Escaped(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50 - 12),
                      child: TextButton(onPressed: () {}, child: const Text('This is an escaped button')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
