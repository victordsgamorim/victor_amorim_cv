import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';
import 'package:victor_amorim_portifolio/ui/components/rotate_side_button.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_menu_horizontal_bar.dart';

class SkeletonMainMenuBottomBar extends StatelessWidget {
  const SkeletonMainMenuBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonMenuHorizontalBar(
      width: MediaQuery.of(context).size.width,
      height: 20,
      border: Border(top: BorderSide(color: ThemeColour.primaryColor[800]!)),
      padding: const EdgeInsets.fromLTRB(20, 2, 5, 0),
      hasBottomBorder: false,
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.digit6):
            const ProblemsShortcut(),
        LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.digit9):
            const _GitShortcut(),
        LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.digit4):
            const _RunShortcut(),
        LogicalKeySet(LogicalKeyboardKey.altLeft, LogicalKeyboardKey.f12):
            const _TerminalShortcut(),
      },
      actions: {
        ProblemsShortcut: CallbackAction<ProblemsShortcut>(
            onInvoke: (ProblemsShortcut intent) => print('Problem')),
        _GitShortcut: CallbackAction<_GitShortcut>(
            onInvoke: (_GitShortcut intent) => print('Git')),
        _RunShortcut: CallbackAction<_RunShortcut>(
            onInvoke: (_RunShortcut intent) => print('Run')),
        _TerminalShortcut: CallbackAction<_TerminalShortcut>(
            onInvoke: (_TerminalShortcut intent) => print('Terminal')),
      },
      leftChildren: [
        RotatedSideButton.none(
          title: 'TODO',
          tooltip: 'TODO',
          icon: const Icon(Icons.toc_rounded),
        ),
        RotatedSideButton.none(
          title: 'Problems',
          tooltip: 'Problems Alt+6',
          icon: const Icon(Icons.error),
        ),
        RotatedSideButton.none(
          title: 'Git',
          tooltip: 'Git Alt+9',
          icon: const Icon(Icons.commit_rounded),
        ),
        RotatedSideButton.none(
          title: 'Terminal',
          tooltip: 'Terminal Alt+F12',
          icon: const Icon(Icons.terminal_rounded),
        ),
        RotatedSideButton.none(
          title: 'Profile',
          tooltip: 'Profile',
          icon: const Icon(Icons.account_circle),
        ),
        RotatedSideButton.none(
          title: 'Dart Analysis',
          tooltip: 'Data Analysis',
          icon: const Icon(Icons.speed_rounded),
        ),
        RotatedSideButton.none(
          title: 'Messages',
          tooltip: 'Messages',
          icon: const Icon(Icons.message_rounded),
        ),
        RotatedSideButton.none(
          title: 'Logcat',
          tooltip: 'Logcat',
          icon: const Icon(Icons.line_style_outlined),
        ),
        RotatedSideButton.none(
          title: 'Run',
          tooltip: 'Run Alt+4',
          icon: const Icon(Icons.play_arrow_sharp),
        ),
        RotatedSideButton.none(
          title: 'App Inspection',
          tooltip: 'App Inspection',
          icon: const Icon(Icons.account_box),
        ),
      ],
      rightChildren: [
        RotatedSideButton.none(
          title: 'Event Log',
          tooltip: 'Event Log',
          icon: const Icon(Icons.messenger_outline_outlined),
        ),
        RotatedSideButton.none(
          title: 'Layout Inspector',
          tooltip: 'Layout Inspector',
          icon: const Icon(Icons.layers_outlined),
        ),
      ],
    );
  }
}

class ProblemsShortcut extends Intent {
  const ProblemsShortcut();
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
