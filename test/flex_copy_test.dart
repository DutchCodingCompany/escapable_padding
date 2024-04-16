import 'package:escapable_padding/escapable_padding.dart';
import 'package:escapable_padding/src/flex_copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Row Copy copies row with new children', () {
    const row = Row(
      children: [Text('test'), Escaped(child: Text('escaped')), Text('test2')],
    );
    final rowCopy = row.copyWith();
    expect(rowCopy.children.length, 3);
    expect(rowCopy.children[0], isA<Text>());
    expect(rowCopy.children[1], isA<Escaped>());
    expect(rowCopy.children[2], isA<Text>());

    final rowCopy2 = row.copyWith(
      children: [const Text('test'), const Text('test2')],
    );

    expect(rowCopy2.children.length, 2);
    expect(rowCopy2.children[0], isA<Text>());
    expect(rowCopy2.children[1], isA<Text>());
  });

  test('Column Copy copies column with new children', () {
    const column = Column(
      children: [Text('test'), Escaped(child: Text('escaped')), Text('test2')],
    );
    final columnCopy = column.copyWith();
    expect(columnCopy.children.length, 3);
    expect(columnCopy.children[0], isA<Text>());
    expect(columnCopy.children[1], isA<Escaped>());
    expect(columnCopy.children[2], isA<Text>());

    final columnCopy2 = column.copyWith(
      children: [const Text('test'), const Text('test2')],
    );

    expect(columnCopy2.children.length, 2);
    expect(columnCopy2.children[0], isA<Text>());
    expect(columnCopy2.children[1], isA<Text>());
  });

  test('Flex Copy copies flex with new children', () {
    const flex = Flex(
      direction: Axis.horizontal,
      children: [Text('test'), Escaped(child: Text('escaped')), Text('test2')],
    );
    final flexCopy = flex.copyWith();
    expect(flexCopy.children.length, 3);
    expect(flexCopy.children[0], isA<Text>());
    expect(flexCopy.children[1], isA<Escaped>());
    expect(flexCopy.children[2], isA<Text>());

    final flexCopy2 = flex.copyWith(
      children: [const Text('test'), const Text('test2')],
    );

    expect(flexCopy2.children.length, 2);
    expect(flexCopy2.children[0], isA<Text>());
    expect(flexCopy2.children[1], isA<Text>());
  });
}
