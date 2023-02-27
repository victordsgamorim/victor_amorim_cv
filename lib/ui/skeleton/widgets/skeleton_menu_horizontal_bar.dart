import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';

class SkeletonMenuHorizontalBar extends StatelessWidget {
  final double width;
  final List<Widget> leftChildren;
  final List<Widget> rightChildren;
  final EdgeInsets padding;
  final bool hasBottomBorder;
  final Border? border;
  final double height;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final FocusNode? node;

  const SkeletonMenuHorizontalBar({
    super.key,
    required this.width,
    required this.leftChildren,
    required this.rightChildren,
    this.padding = const EdgeInsets.symmetric(horizontal: 5.0),
    this.hasBottomBorder = true,
    this.border,
    this.height = 25,
    this.shortcuts,
    this.actions,
    this.node,
  }) : assert(actions == null || shortcuts != null,
            'only implement action with shortcuts');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: border,
        color: ThemeColour.primaryColor[500],
      ),
      child: Padding(
          padding: padding,
          child: Shortcuts(
            shortcuts: shortcuts ?? {},
            child: Actions(
              actions: actions ?? <Type, Action<Intent>>{},
              child: Focus(
                focusNode: node,
                child: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Row(
                          children: leftChildren,
                        )),
                    Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          color: ThemeColour.primaryColor[500],
                          child: Row(
                            children: rightChildren,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
