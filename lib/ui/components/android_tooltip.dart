import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';

class AndroidTooltip extends StatelessWidget {
  final String? message;
  final Widget child;

  const AndroidTooltip({super.key, required this.child, this.message});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message ?? '',
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColour.primaryColor[300]!),
        color: ThemeColour.primaryColor[500],
      ),
      child: child,
    );
  }
}
