import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';

class SkeletonMenuVerticalBar extends StatelessWidget {
  final List<Widget> menus;

  const SkeletonMenuVerticalBar({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      decoration: BoxDecoration(
          color: ThemeColour.primaryColor[500],
          border: Border(
            right: BorderSide(
              color: ThemeColour.primaryColor[800]!,
            ),
          )),
      // alignment: const Alignment(0, -1),
      child: Column(
        children: menus,
      ),
    );
  }
}
