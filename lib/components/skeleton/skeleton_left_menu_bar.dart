import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/components/rotate_side_button.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_menu_side_bar.dart';

class SkeletonLeftMenuBar extends StatelessWidget {
  const SkeletonLeftMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonMenuSideBar(menus: [
      RotatedSideButton.antiClockwise(
        title: 'Project',
        icon: const Icon(Icons.folder),
      ),
      RotatedSideButton.antiClockwise(
        title: 'Commit',
        icon: const Icon(Icons.commit_rounded),
      ),
      RotatedSideButton.antiClockwise(
        title: 'Pull Requests',
        icon: const Icon(Icons.manage_search_rounded),
      ),
    ]);
  }
}
