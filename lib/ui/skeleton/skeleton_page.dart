import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:victor_amorim_portifolio/logic/behaviour/behavior_logic.dart';
import 'package:victor_amorim_portifolio/logic/behaviour/behaviour.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/skeleton_bottom_body.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_left_body.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_left_menu_bar.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_main_menu_bottom_bar.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_main_menu_top_bar.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_right_body.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_right_menu_bar.dart';

class AndroidStudio extends StatelessWidget with GetItMixin {
  AndroidStudio({super.key});

  @override
  Widget build(BuildContext context) {
    final behaviour =
        watchX((BehaviourLogic behaviourLogic) => behaviourLogic.behaviours);
    final left = behaviour[MenuType.left];
    final bottom = behaviour[MenuType.bottom];
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            SkeletonMainMenuTopBar(node: FocusNode()),
            Expanded(
              child: Row(
                children: [
                  SkeletonLeftMenuBar(
                      node: left != null ? left.node : FocusNode()),
                  Visibility(
                    visible: left != null ? left.isOpen : true,
                    child: const SkeletonLeftBody(),
                  ),
                  const SkeletonRightBody(),
                  SkeletonRightMenuBar(node: FocusNode()),
                ],
              ),
            ),
            Visibility(
              visible: bottom != null ? bottom.isOpen : false,
              child: const SkeletonBottomBody(),
            ),
            SkeletonMainMenuBottomBar(
                node: bottom != null ? bottom.node : FocusNode())
          ],
        ),
      ),
    );
  }
}
