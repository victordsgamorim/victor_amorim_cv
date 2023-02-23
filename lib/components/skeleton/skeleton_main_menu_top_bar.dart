import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/components/elevated_button_border.dart';
import 'package:victor_amorim_portifolio/components/icon_placeholder.dart';
import 'package:victor_amorim_portifolio/components/android_icon_button.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_menu_top_bar.dart';
import 'package:victor_amorim_portifolio/components/vertical_divider_v2.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_color.dart';

class SkeletonMainMenuTopBar extends StatelessWidget {
  const SkeletonMainMenuTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkeletonMenuTopBar(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20, 2, 5, 0),
          hasBottomBorder: false,
          leftChildren: [_LeftClassHistory()],
          rightChildren: [_RightClassHistory()],
        ),
        const _ExtraBarLine(),
      ],
    );
  }
}

class _LeftClassHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text('victor_amorim_portfolio'),
        Icon(Icons.arrow_right),
        Text('lib'),
        Icon(Icons.arrow_right),
        Text('components'),
        Icon(Icons.arrow_right),
        Text('skeleton'),
      ],
    );
  }
}

class _RightClassHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ElevatedButtonBorder(
          icon: Icon(Icons.phone_android),
          titles: ['Chrome (web)'],
        ),
        const SizedBox(width: 15),
        ElevatedButtonBorder(
          icon: AndroidIconButton.dot(
            icon: const FlutterLogo(),
            radius: 9,
            isActivated: false,
          ),
          titles: const ['main.dart'],
        ),
        const SizedBox(width: 15),
        const ElevatedButtonBorder(
          isActivated: false,
          icon: Icon(Icons.phone_iphone),
          titles: ['Nexus 4 API 32'],
        ),
        const SizedBox(width: 15),
        AndroidIconButton.dot(
            icon: const Icon(Icons.play_arrow, color: Colors.green)),
        ...List.generate(
          7,
          (index) => const AndroidIconButton(icon: IconPlaceholder()),
        ),
        const VerticalDividerV2(),
        const Text('Git:'),
        ...List.generate(
          5,
          (index) => const AndroidIconButton(icon: IconPlaceholder()),
        ),
        const VerticalDividerV2(),
        ...List.generate(
          2,
          (index) => const AndroidIconButton(icon: IconPlaceholder()),
        ),
        const VerticalDividerV2(),
        ...List.generate(
          3,
          (index) => const AndroidIconButton(icon: IconPlaceholder()),
        ),
      ],
    );
  }
}

class _ExtraBarLine extends StatelessWidget {
  const _ExtraBarLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ThemeColor.primaryColor[800]!),
          ),
          color: ThemeColor.primaryColor[500]),
    );
  }
}
