import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/main.dart';
import 'package:victor_amorim_portifolio/ui/components/rotate_side_button.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_menu_vertical_bar.dart';

class SkeletonLeftMenuBar extends StatelessWidget {
  const SkeletonLeftMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonMenuVerticalBar(menus: [
      RotatedSideButton.antiClockwise(
          title: 'Project',
          icon: const Icon(Icons.folder),
          onTap: () {
            behaviourLogic.onLeftTap(index: 0);
          }),
      RotatedSideButton.antiClockwise(
        title: 'Commit',
        icon: const Icon(Icons.commit_rounded),
        onTap: () {
          behaviourLogic.onLeftTap(index: 1);
        },
      ),
      RotatedSideButton.antiClockwise(
        title: 'Pull Requests',
        icon: const Icon(Icons.manage_search_rounded),
        onTap: () {
          behaviourLogic.onLeftTap(index: 2);
        },
      ),
    ]);
  }
}
