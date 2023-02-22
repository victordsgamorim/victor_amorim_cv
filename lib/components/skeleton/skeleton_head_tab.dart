import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_color.dart';

class SkeletonHeadTab extends StatelessWidget {
  final double width;
  final List<Widget> children;

  const SkeletonHeadTab(
      {super.key, required this.width, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: ThemeColor.primaryColor[800]!),
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
