import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';
import 'package:victor_amorim_portifolio/ui/components/android_dropdown.dart';
import 'package:victor_amorim_portifolio/ui/components/android_icon_button.dart';
import 'package:victor_amorim_portifolio/ui/components/android_large_button.dart';
import 'package:victor_amorim_portifolio/ui/components/elevated_button_border.dart';
import 'package:victor_amorim_portifolio/ui/components/entities/dropdown_interface.dart';
import 'package:victor_amorim_portifolio/ui/components/icon_placeholder.dart';
import 'package:victor_amorim_portifolio/ui/components/vertical_divider_v2.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_menu_horizontal_bar.dart';

const _icon = Icon(Icons.phone_android, color: Colors.blue);

class SkeletonMainMenuTopBar extends StatelessWidget {
  final FocusNode node;

  const SkeletonMainMenuTopBar({Key? key, required this.node})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkeletonMenuHorizontalBar(
          node: node,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Row(
          children: const [
            Text('victor_amorim_portfolio'),
            Icon(Icons.arrow_right),
            Text('lib'),
            Icon(Icons.arrow_right),
            Text('components'),
            Icon(Icons.arrow_right),
            Text('skeleton'),
          ],
        ),
      ),
    );
  }
}

class _RightClassHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AndroidDropdown<AndroidDropdownItem>(
          width: 200,
          items: const [
            AndroidDropdownItem(value: 'Chrome', icon: _icon),
            AndroidDropdownItem(
                value: 'macOS',
                icon: _icon,
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.white))),
            AndroidDropdownItem(value: 'Open iOS Simulator'),
          ],
          headBuilder: (AndroidDropdownItem item) =>
              ElevatedButtonBorder(icon: _icon, title: item.value),
          itemBuilder: (_, AndroidDropdownItem item) {
            return AndroidLargeButton(
              icon: item.icon ?? const Opacity(opacity: 0, child: _icon),
              title: item.value,
            );
          },
        ),
        const SizedBox(width: 15),
        AndroidDropdown<AndroidDropdownItem>(
          initValue: 1,
          width: 200,
          items: [
            const AndroidDropdownItem(
                value: 'Edit Configuration...',
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.white),
                )),
            AndroidDropdownItem(
                value: 'main.dart',
                icon: AndroidIconButton.dot(
                  icon: const FlutterLogo(),
                  padding: EdgeInsets.zero,
                  isActivated: false,
                  radius: 7,
                )),
          ],
          headBuilder: (AndroidDropdownItem item) {
            return ElevatedButtonBorder(
              icon: AndroidIconButton.dot(
                icon: const FlutterLogo(),
                padding: EdgeInsets.zero,
                isActivated: false,
                radius: 7,
              ),
              title: item.value,
            );
          },
          itemBuilder: (_, AndroidDropdownItem item) {
            return AndroidLargeButton(
              icon: item.icon ?? const Opacity(opacity: 0, child: _icon),
              title: item.value,
            );
          },
        ),
        const SizedBox(width: 15),
        AndroidDropdown<AndroidDropdownItem>(
          items: const [
            AndroidDropdownItem(
                value: 'Nexus 4 API 32', icon: Icon(Icons.phone_android)),
          ],
          headBuilder: (AndroidDropdownItem item) {
            return ElevatedButtonBorder(
              isActivated: false,
              icon: const Icon(Icons.phone_iphone),
              title: item.value,
            );
          },
          itemBuilder: (_, AndroidDropdownItem item) {
            return AndroidLargeButton(
              icon: item.icon ?? const Opacity(opacity: 0, child: _icon),
              title: item.value,
            );
          },
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
            bottom: BorderSide(color: ThemeColour.primaryColor[800]!),
          ),
          color: ThemeColour.primaryColor[500]),
    );
  }
}
