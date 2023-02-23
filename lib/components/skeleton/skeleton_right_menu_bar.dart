import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/components/android_icon_button.dart';
import 'package:victor_amorim_portifolio/components/icon_placeholder.dart';
import 'package:victor_amorim_portifolio/components/rotate_side_button.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_menu_side_bar.dart';

class SkeletonRightMenuBar extends StatelessWidget {
  const SkeletonRightMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonMenuSideBar(menus: [
      RotatedSideButton.clockwise(
        title: 'Flutter Outline',
        icon: const AndroidIconButton(
          icon: FlutterLogo(),
          isActivated: false,
        ),
      ),
      RotatedSideButton.clockwise(
        title: 'Flutter Performance',
        icon: AndroidIconButton.dot(
          icon: const FlutterLogo(),
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
          isActivated: false,
        ),
      ),
    ]);
  }
}
