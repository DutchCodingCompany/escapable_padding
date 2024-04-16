import 'package:escapable_padding/escapable_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EscapablePadding wraps flexChild with padding', (WidgetTester tester) async {
    const escapedWidget = Text('test');

    const widget = MaterialApp(
      home: Scaffold(
        body: Escaped(
          child: escapedWidget,
        ),
      ),
    );

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    final escaped = tester.widget<Escaped>(find.byType(Escaped));

    expect(
      escaped.child,
      escapedWidget,
      reason: 'the widget wrapped should be exactly the same as the widget provided',
    );
  });
}
