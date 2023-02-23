import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_color.dart';

class VerticalDividerV2 extends StatelessWidget {
  const VerticalDividerV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: _CustomVerticalDivider(),
    );
  }
}

class _CustomVerticalDivider extends VerticalDivider {
  _CustomVerticalDivider()
      : super(
          color: ThemeColor.primaryColor[400],
          width: 1,
        );
}
