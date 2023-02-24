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

  const SkeletonMenuHorizontalBar({
    super.key,
    required this.width,
    required this.leftChildren,
    required this.rightChildren,
    this.padding = const EdgeInsets.symmetric(horizontal: 5.0),
    this.hasBottomBorder = true,
    this.border,
    this.height = 25,
  });

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
    );
  }
}
