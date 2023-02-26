import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:victor_amorim_portifolio/logic/behavior_logic.dart';
import 'package:victor_amorim_portifolio/main.dart';
import 'package:victor_amorim_portifolio/ui/components/rotate_side_button.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_menu_vertical_bar.dart';

class SkeletonLeftMenuBar extends StatelessWidget {
  const SkeletonLeftMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonMenuVerticalBar(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.digit1):
            const ProjectShortcut(),
        LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.digit0):
            const CommitShortcut(),
      },
      actions: {
        ProjectShortcut: CallbackAction<ProjectShortcut>(
          onInvoke: (ProjectShortcut intent) =>
              behaviourLogic.onTap(MenuType.left, index: 0),
        ),
        CommitShortcut: CallbackAction<CommitShortcut>(
          onInvoke: (CommitShortcut intent) =>
              behaviourLogic.onTap(MenuType.left, index: 1),
        ),
      },
      menus: [
        RotatedSideButton.antiClockwise(
          title: 'Project',
          tooltip: 'Project Alt+1',
          icon: const Icon(Icons.folder),
          onTap: () {
            behaviourLogic.onTap(MenuType.left, index: 0);
          },
        ),
        RotatedSideButton.antiClockwise(
          title: 'Commit',
          tooltip: 'Commit Alt+0',
          icon: const Icon(Icons.commit_rounded),
          onTap: () {
            behaviourLogic.onTap(MenuType.left, index: 1);
          },
        ),
        RotatedSideButton.antiClockwise(
          title: 'Pull Requests',
          tooltip: 'Pull Requests',
          icon: const Icon(Icons.manage_search_rounded),
          onTap: () {
            behaviourLogic.onTap(MenuType.left, index: 2);
          },
        ),
      ],
    );
  }
}

class ProjectShortcut extends Intent {
  const ProjectShortcut();
}

class CommitShortcut extends Intent {
  const CommitShortcut();
}
