import 'package:flutter/material.dart';
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
      leftChildren: [
        RotatedSideButton.none(
          title: 'TODO',
          icon: const Icon(Icons.toc_rounded),
        ),
        RotatedSideButton.none(
          title: 'Problems',
          icon: const Icon(Icons.error),
        ),
        RotatedSideButton.none(
          title: 'Git',
          icon: const Icon(Icons.commit_rounded),
        ),
        RotatedSideButton.none(
          title: 'Terminal',
          icon: const Icon(Icons.terminal_rounded),
        ),
        RotatedSideButton.none(
          title: 'Profile',
          icon: const Icon(Icons.account_circle),
        ),
        RotatedSideButton.none(
          title: 'Dart Analysis',
          icon: const Icon(Icons.speed_rounded),
        ),
        RotatedSideButton.none(
          title: 'Messages',
          icon: const Icon(Icons.message_rounded),
        ),
        RotatedSideButton.none(
          title: 'Logcat',
          icon: const Icon(Icons.line_style_outlined),
        ),
        RotatedSideButton.none(
          title: 'Run',
          icon: const Icon(Icons.play_arrow_sharp),
        ),
        RotatedSideButton.none(
          title: 'App Inspection',
          icon: const Icon(Icons.account_box),
        ),
      ],
      rightChildren: [
        RotatedSideButton.none(
          title: 'Event Log',
          icon: const Icon(Icons.messenger_outline_outlined),
        ),
        RotatedSideButton.none(
          title: 'Layout Inspector',
          icon: const Icon(Icons.layers_outlined),
        ),
      ],
    );
  }
}
