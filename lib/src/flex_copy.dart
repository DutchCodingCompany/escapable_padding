import 'package:flutter/widgets.dart';

extension RowCopy on Row {
  Row copyWith({
    List<Widget>? children,
  }) {
    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children ?? this.children,
    );
  }
}

extension ColumnCopy on Column {
  Column copyWith({
    List<Widget>? children,
  }) {
    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children ?? this.children,
    );
  }
}

extension FlexCopy on Flex {
  Flex copyWith({
    List<Widget>? children,
  }) {
    return Flex(
      key: key,
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children ?? this.children,
    );
  }
}
