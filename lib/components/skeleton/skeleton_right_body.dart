import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_color.dart';

class SkeletonRightBody extends StatelessWidget {
  const SkeletonRightBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: ThemeColor.primaryColor[800]));
  }
}
