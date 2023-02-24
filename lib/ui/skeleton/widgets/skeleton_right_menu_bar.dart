import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/ui/components/android_icon_button.dart';
import 'package:victor_amorim_portifolio/ui/components/rotate_side_button.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_menu_vertical_bar.dart';

class SkeletonRightMenuBar extends StatelessWidget {
  const SkeletonRightMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonMenuVerticalBar(menus: [
      RotatedSideButton.clockwise(
        title: 'Flutter Outline',
        icon: const AndroidIconButton(
          padding: EdgeInsets.zero,
          icon: FlutterLogo(),
          isActivated: false,
        ),
      ),
      RotatedSideButton.clockwise(
        title: 'Flutter Performance',
        icon: AndroidIconButton.dot(
          icon: const FlutterLogo(),
          padding: EdgeInsets.zero,
          radius: 9,
          isActivated: false,
        ),
      ),
      RotatedSideButton.clockwise(
        title: 'Device Manager',
        icon: const Icon(Icons.phonelink_outlined),
      ),
      RotatedSideButton.clockwise(
        title: 'Flutter Inspector',
        icon: AndroidIconButton.dot(
          icon: const FlutterLogo(),
          radius: 9,
          padding: EdgeInsets.zero,
          isActivated: false,
        ),
      ),
    ]);
  }
}
