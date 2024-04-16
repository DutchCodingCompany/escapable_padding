import 'package:escapable_padding/escapable_padding.dart';
import 'package:escapable_padding/src/escapable_padding.dart';
import 'package:flutter/widgets.dart';

/// A widget that allows its child to escape the padding provided by [EscapablePadding].
class Escaped extends StatelessWidget {
  /// Creates a widget that allows its child to escape the padding provided by [EscapablePadding].
  const Escaped({required this.child, super.key});

  /// The widget that should be able to escape the padding.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
