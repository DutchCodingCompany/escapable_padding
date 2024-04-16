import 'package:escapable_padding/escapable_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fakes/fake_build_context.dart';

/// This is a widget test for the EscapablePadding class in `src/escapable_padding_example.dart`.
/// The test checks if the EscapablePadding widget wraps the flexChild with padding.
void main() {
  group('Column -', () {
    testWidgets('EscapablePadding wraps flexChild with padding', (WidgetTester tester) async {
      const widget = MaterialApp(
        home: Scaffold(
          body: EscapablePadding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            flexChild: Column(
              children: [Text('test'), Escaped(child: Text('escaped')), Text('test2')],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final column = tester.widget<Column>(find.byType(Column));

      expect(column.children.length, 3);
      expect(column.children[0], isA<Padding>());
      expect(column.children[1], isA<Escaped>());
      expect(column.children[2], isA<Padding>());
    });

    test("can't apply vertical padding", () {
      const widget = EscapablePadding(
        padding: EdgeInsets.symmetric(vertical: 50),
        flexChild: Column(
          children: [Text('test'), Escaped(child: Text('escaped')), Text('test2')],
        ),
      );

      expect(
        () {
          widget.build(FakeBuildContext());
        },
        throwsAssertionError,
      );
    });
  });

  group('Row -', () {
    testWidgets('EscapablePadding wraps flexChild with padding', (WidgetTester tester) async {
      const widget = MaterialApp(
        home: Scaffold(
          body: EscapablePadding(
            padding: EdgeInsets.symmetric(vertical: 50),
            flexChild: Row(
              children: [Text('test'), Escaped(child: Text('escaped')), Text('test2')],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final row = tester.widget<Row>(find.byType(Row));

      expect(row.children.length, 3);
      expect(row.children[0], isA<Padding>());
      expect(row.children[1], isA<Escaped>());
      expect(row.children[2], isA<Padding>());
    });

    test("can't apply horizontal padding", () {
      const widget = EscapablePadding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        flexChild: Row(
          children: [Text('test'), Escaped(child: Text('escaped')), Text('test2')],
        ),
      );

      expect(
        () {
          widget.build(FakeBuildContext());
        },
        throwsAssertionError,
      );
    });
  });

  group('Flex -', () {
    testWidgets('EscapablePadding wraps flexChild with padding', (WidgetTester tester) async {
      const widget = MaterialApp(
        home: Scaffold(
          body: EscapablePadding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            flexChild: Flex(
              direction: Axis.vertical,
              children: [Text('test'), Escaped(child: Text('escaped')), Text('test2')],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      final flex = tester.widget<Flex>(find.byType(Flex));

      expect(flex.children.length, 3);
      expect(flex.children[0], isA<Padding>());
      expect(flex.children[1], isA<Escaped>());
      expect(flex.children[2], isA<Padding>());
    });

    test("can't apply horizontal padding if Flexdirection is horizontal", () {
      const widget = EscapablePadding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        flexChild: Flex(
          direction: Axis.horizontal,
          children: [Text('test'), Escaped(child: Text('escaped')), Text('test2')],
        ),
      );

      expect(
        () {
          widget.build(FakeBuildContext());
        },
        throwsAssertionError,
      );
    });

    test("can't apply vertical padding if Flexdirection is vertical", () {
      const widget = EscapablePadding(
        padding: EdgeInsets.symmetric(vertical: 50),
        flexChild: Flex(
          direction: Axis.vertical,
          children: [Text('test'), Escaped(child: Text('escaped')), Text('test2')],
        ),
      );

      expect(
        () {
          widget.build(FakeBuildContext());
        },
        throwsAssertionError,
      );
    });
  });

  test('Escapable Padding must contain a Row, Column or Flex', () {
    const widget = EscapablePadding(
      padding: EdgeInsets.symmetric(vertical: 50),
      flexChild: Text('test'),
    );

    expect(
      () {
        widget.build(FakeBuildContext());
      },
      throwsAssertionError,
    );
  });
}
