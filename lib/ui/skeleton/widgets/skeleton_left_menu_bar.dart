import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:victor_amorim_portifolio/core/extensions/mixin_iterable.dart';
import 'package:victor_amorim_portifolio/core/utils.dart';
import 'package:victor_amorim_portifolio/logic/behaviour/behaviour.dart';
import 'package:victor_amorim_portifolio/main.dart';
import 'package:victor_amorim_portifolio/ui/components/entities/android_button_settings.dart';
import 'package:victor_amorim_portifolio/ui/components/rotate_side_button.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_menu_vertical_bar.dart';

class SkeletonLeftMenuBar extends StatefulWidget {
  final FocusNode node;

  const SkeletonLeftMenuBar({super.key, required this.node});

  @override
  State<SkeletonLeftMenuBar> createState() => _SkeletonLeftMenuBarState();
}

class _SkeletonLeftMenuBarState extends State<SkeletonLeftMenuBar> {
  late final List<AndroidButtonSettings> settings;

  @override
  void initState() {
    super.initState();
    settings = [
      AndroidButtonSettings(
        title: 'Project',
        tooltip: Utils.whenPlatformIs<String>(
          windows: () => 'Alt+0',
          macOS: () => '${'\u2318'}1',
        )!,
        icon: const Icon(Icons.folder),
      ),
      AndroidButtonSettings(
        title: 'Commit',
        tooltip: Utils.whenPlatformIs<String>(
          windows: () => 'Alt+0',
          macOS: () => '${'\u2318'}0',
        )!,
        icon: const Icon(Icons.commit_rounded),
      ),
      const AndroidButtonSettings(
        title: 'Pull Requests',
        icon: Icon(Icons.manage_search_rounded),
      ),
      const AndroidButtonSettings(
        title: 'Structure',
        icon: Icon(Icons.account_tree),
      ),
      const AndroidButtonSettings(
        title: 'Bookmarks',
        icon: Icon(Icons.bookmark),
      ),
      const AndroidButtonSettings(
        title: 'Build Variants',
        icon: Icon(Icons.android),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SkeletonMenuVerticalBar(
      node: widget.node,
      shortcuts: _shortcuts(),
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
      leftMenus: settings
          .sublist(0, settings.length - 3)
          .mapIndexed<RotatedSideButton>(
              (item, index) => RotatedSideButton.antiClockwise(
                    title: item.title,
                    tooltip: '${item.title} ${item.tooltip ?? ''}'.trim(),
                    icon: item.icon,
                    onTap: () {
                      behaviourLogic.onTap(MenuType.left, index: index);
                    },
                  ))
          .toList(),
      rightMenus: settings
          .sublist(settings.length - 3, settings.length)
          .mapIndexed<RotatedSideButton>((item, index) =>
              RotatedSideButton.antiClockwise(
                title: item.title,
                tooltip: '${item.title} ${item.tooltip ?? ''}'.trim(),
                icon: item.icon,
                onTap: () => behaviourLogic.onTap(MenuType.left, index: index),
              ))
          .toList(),
    );
  }

  Map<ShortcutActivator, Intent>? _shortcuts() {
    final projectShortcut = Utils.whenPlatformIs<LogicalKeySet>(
      windows: () =>
          LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.digit1),
      macOS: () =>
          LogicalKeySet(LogicalKeyboardKey.metaLeft, LogicalKeyboardKey.digit1),
    );

    final commitShortcut = Utils.whenPlatformIs<LogicalKeySet>(
        windows: () => LogicalKeySet(
            LogicalKeyboardKey.altLeft, LogicalKeyboardKey.digit0),
        macOS: () => LogicalKeySet(
            LogicalKeyboardKey.metaLeft, LogicalKeyboardKey.digit0));

    return {
      projectShortcut!: const ProjectShortcut(),
      commitShortcut!: const CommitShortcut()
    };
  }
}

class ProjectShortcut extends Intent {
  const ProjectShortcut();
}

class CommitShortcut extends Intent {
  const CommitShortcut();
}
