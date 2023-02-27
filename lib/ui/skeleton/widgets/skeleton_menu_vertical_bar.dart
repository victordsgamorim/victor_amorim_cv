import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';

class SkeletonMenuVerticalBar extends StatelessWidget {
  final List<Widget> leftMenus;
  final List<Widget> rightMenus;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final FocusNode node;

  const SkeletonMenuVerticalBar({
    super.key,
    required this.leftMenus,
    required this.rightMenus,
    this.shortcuts,
    this.actions,
    required this.node,
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
            focusNode: node,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Column(children: leftMenus),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(children: rightMenus),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
