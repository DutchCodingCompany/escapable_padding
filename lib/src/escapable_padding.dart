import 'package:escapable_padding/escapable_padding.dart';
import 'package:escapable_padding/src/flex_copy.dart';
import 'package:flutter/widgets.dart';

/// A widget that provides padding that can be escaped by [Escaped] widget.
class EscapablePadding extends StatelessWidget {
  /// Creates a widget that provides padding that can be escaped by [Escaped] widget.
  const EscapablePadding({required this.padding, required this.flexChild, super.key});

  /// The padding that should be applied to the [flexChild].
  final EdgeInsets padding;

  /// The child that should be wrapped with padding.
  ///
  /// The child can be [Column], [Row] or [Flex].
  final Widget flexChild;

  Widget _wrapWithPaddingIfUnescaped(Widget widget) {
    if (widget is Escaped) {
      return widget;
    }

    return Padding(
      padding: padding,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (flexChild) {
      case Column():
        assert(padding.top == 0 && padding.bottom == 0, 'Vertical padding is not supported for Column');

        return (flexChild as Column).copyWith(
          children: (flexChild as Column).children.map(_wrapWithPaddingIfUnescaped).toList(),
        );
      case Row():
        assert(padding.left == 0 && padding.right == 0, 'Horizontal padding is not supported for Row');

        return (flexChild as Row).copyWith(
          children: (flexChild as Row).children.map(_wrapWithPaddingIfUnescaped).toList(),
        );
      case Flex():
        final flex = flexChild as Flex;
        if (flex.direction == Axis.horizontal) {
          assert(
            padding.left == 0 && padding.right == 0,
            'Horizontal padding is not supported for Flex with horizontal direction',
          );
        } else {
          assert(
            padding.top == 0 && padding.bottom == 0,
            'Vertical padding is not supported for Flex with vertical direction',
          );
        }

        return flex.copyWith(
          children: flex.children.map(_wrapWithPaddingIfUnescaped).toList(),
        );
    }

    assert(false, 'flexChild must be Column, Row or Flex');

    // This line is unreachable, but it is required to satisfy the return type of the method.
    // coverage:ignore-start
    return Container();
    // coverage:ignore-end
  }
}
