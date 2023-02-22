import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/components/icon_placeholder.dart';
import 'package:victor_amorim_portifolio/components/rotate_side_button.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_left_body.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_menu_side_bar.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_right_body.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_color.dart';

class ResizeContainer extends StatelessWidget {
  const ResizeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SkeletonMenuSideBar(menus: [
            RotatedSideButton.antiClockwise(
              title: 'Project',
              icon: Icons.add,
              quarterTurns: 3,
            ),
            RotatedSideButton.antiClockwise(
              title: 'Commit',
              icon: Icons.add,
              quarterTurns: 3,
            ),
            RotatedSideButton.antiClockwise(
              title: 'Pull Requests',
              icon: Icons.add,
              quarterTurns: 3,
            ),
          ]),
          const SkeletonLeftBody(),
          const SkeletonRightBody(),
          SkeletonMenuSideBar(menus: [
            RotatedSideButton.antiClockwise(
              title: 'Project',
              icon: Icons.add,
              quarterTurns: 3,
            ),
            RotatedSideButton.antiClockwise(
              title: 'Commit',
              icon: Icons.add,
              quarterTurns: 3,
            ),
            RotatedSideButton.antiClockwise(
              title: 'Pull Requests',
              icon: Icons.add,
              quarterTurns: 3,
            ),
          ]),
        ],
      ),
    );
  }
}
