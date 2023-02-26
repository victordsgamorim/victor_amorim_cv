import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';

class SkeletonMenuVerticalBar extends StatelessWidget {
  final List<Widget> menus;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;

  const SkeletonMenuVerticalBar({
    super.key,
    required this.menus,
    this.shortcuts,
    this.actions,
  }) : assert(actions == null || shortcuts != null,
            'only implement action with shortcuts');

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
      child: Shortcuts(
        shortcuts: shortcuts ?? {},
        child: Actions(
          actions: actions ?? <Type, Action<Intent>>{},
          child: Focus(
              autofocus: true,
              child: Column(
                children: menus,
              )),
        ),
      ),
    );
  }
}
