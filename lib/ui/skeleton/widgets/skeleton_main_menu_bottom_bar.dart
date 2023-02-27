import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:victor_amorim_portifolio/core/extensions/mixin_iterable.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';
import 'package:victor_amorim_portifolio/core/utils.dart';
import 'package:victor_amorim_portifolio/logic/behaviour/behaviour.dart';
import 'package:victor_amorim_portifolio/main.dart';
import 'package:victor_amorim_portifolio/ui/components/entities/android_button_settings.dart';
import 'package:victor_amorim_portifolio/ui/components/rotate_side_button.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_menu_horizontal_bar.dart';

class SkeletonMainMenuBottomBar extends StatefulWidget {
  final FocusNode node;

  const SkeletonMainMenuBottomBar({super.key, required this.node});

  @override
  State<SkeletonMainMenuBottomBar> createState() =>
      _SkeletonMainMenuBottomBarState();
}

class _SkeletonMainMenuBottomBarState extends State<SkeletonMainMenuBottomBar> {
  late final List<AndroidButtonSettings> _settings;

  @override
  void initState() {
    super.initState();
    _settings = [
      const AndroidButtonSettings(
        title: 'TODO',
        icon: Icon(Icons.toc_rounded),
      ),
      AndroidButtonSettings(
        title: 'Problems',
        tooltip: Utils.whenPlatformIs<String>(
          windows: () => 'Alt+6',
          macOS: () => '${'\u2318'}6',
        )!,
        icon: const Icon(Icons.error),
      ),
      AndroidButtonSettings(
        title: 'Git',
        tooltip: Utils.whenPlatformIs<String>(
          windows: () => 'Alt+9',
          macOS: () => '${'\u2318'}9',
        )!,
        icon: const Icon(Icons.commit_rounded),
      ),
      AndroidButtonSettings(
        title: 'Terminal',
        tooltip: Utils.whenPlatformIs<String>(
          windows: () => 'Alt+F12',
          macOS: () => '${'\u2325'}F12',
        )!,
        icon: const Icon(Icons.terminal_rounded),
      ),
      const AndroidButtonSettings(
        title: 'Profile',
        icon: Icon(Icons.account_circle),
      ),
      const AndroidButtonSettings(
        title: 'Data Analysis',
        icon: Icon(Icons.speed_rounded),
      ),
      const AndroidButtonSettings(
        title: 'Messages',
        icon: Icon(Icons.message_rounded),
      ),
      const AndroidButtonSettings(
        title: 'Logcat',
        icon: Icon(Icons.line_style_outlined),
      ),
      AndroidButtonSettings(
        title: 'Run',
        tooltip: Utils.whenPlatformIs<String>(
          windows: () => 'Alt+4',
          macOS: () => '${'\u2318'}4',
        )!,
        icon: const Icon(Icons.play_arrow_sharp),
      ),
      const AndroidButtonSettings(
        title: 'App Inspection',
        icon: Icon(Icons.account_box),
      ),
      const AndroidButtonSettings(
        title: 'Event Log',
        icon: Icon(Icons.messenger_outline_outlined),
      ),
      const AndroidButtonSettings(
        title: 'Layout Inspector',
        icon: Icon(Icons.layers_outlined),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SkeletonMenuHorizontalBar(
      node: widget.node,
      width: MediaQuery.of(context).size.width,
      height: 20,
      border: Border(top: BorderSide(color: ThemeColour.primaryColor[800]!)),
      padding: const EdgeInsets.fromLTRB(20, 2, 5, 0),
      hasBottomBorder: false,
      shortcuts: _shortcuts(),
      actions: {
        _ProblemsShortcut: CallbackAction<_ProblemsShortcut>(
          onInvoke: (_ProblemsShortcut intent) =>
              behaviourLogic.onTap(MenuType.bottom, index: 1),
        ),
        _GitShortcut: CallbackAction<_GitShortcut>(
          onInvoke: (_GitShortcut intent) =>
              behaviourLogic.onTap(MenuType.bottom, index: 2),
        ),
        _RunShortcut: CallbackAction<_RunShortcut>(
            onInvoke: (_RunShortcut intent) =>
                behaviourLogic.onTap(MenuType.bottom, index: 8)),
        _TerminalShortcut: CallbackAction<_TerminalShortcut>(
            onInvoke: (_TerminalShortcut intent) =>
                behaviourLogic.onTap(MenuType.bottom, index: 3)),
      },
      leftChildren: _settings
          .sublist(0, _settings.length - 2)
          .mapIndexed<RotatedSideButton>(
            (item, index) => RotatedSideButton.none(
              title: item.title,
              tooltip: '${item.title} ${item.tooltip ?? ''}'.trim(),
              icon: item.icon,
              onTap: () {
                behaviourLogic.onTap(MenuType.bottom, index: index);
              },
            ),
          )
          .toList(),
      rightChildren: _settings
          .sublist(_settings.length - 2, _settings.length)
          .mapIndexed<RotatedSideButton>(
            (item, index) => RotatedSideButton.none(
              title: item.title,
              tooltip: '${item.title} ${item.tooltip ?? ''}'.trim(),
              icon: item.icon,
              onTap: () => behaviourLogic.onTap(MenuType.bottom, index: index),
            ),
          )
          .toList(),
    );
  }

  Map<ShortcutActivator, Intent> _shortcuts() {
    final problemsShortcut = Utils.whenPlatformIs(
      windows: () =>
          LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.digit6),
      macOS: () =>
          LogicalKeySet(LogicalKeyboardKey.metaLeft, LogicalKeyboardKey.digit6),
    )!;

    final gitShortcut = Utils.whenPlatformIs(
      windows: () =>
          LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.digit9),
      macOS: () =>
          LogicalKeySet(LogicalKeyboardKey.metaLeft, LogicalKeyboardKey.digit9),
    )!;

    final runShortcut = Utils.whenPlatformIs(
        windows: () => LogicalKeySet(
            LogicalKeyboardKey.altLeft, LogicalKeyboardKey.digit4),
        macOS: () => LogicalKeySet(
            LogicalKeyboardKey.metaLeft, LogicalKeyboardKey.digit4))!;

    final terminalShortcut = Utils.whenPlatformIs(
        windows: () =>
            LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.f12),
        macOS: () =>
            LogicalKeySet(LogicalKeyboardKey.alt, LogicalKeyboardKey.f12))!;

    return {
      problemsShortcut: const _ProblemsShortcut(),
      gitShortcut: const _GitShortcut(),
      runShortcut: const _RunShortcut(),
      terminalShortcut: const _TerminalShortcut(),
    };
  }
}

class _ProblemsShortcut extends Intent {
  const _ProblemsShortcut();
}

class _GitShortcut extends Intent {
  const _GitShortcut();
}

class _RunShortcut extends Intent {
  const _RunShortcut();
}

class _TerminalShortcut extends Intent {
  const _TerminalShortcut();
}
