import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:victor_amorim_portifolio/logic/behavior_logic.dart';
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
    final left =
        watchX((BehaviourLogic behaviourLogic) => behaviourLogic.leftBehaviour);
    // final right = watchX(
    //     (BehaviourLogic behaviourLogic) => behaviourLogic.rightBehaviour);

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            const SkeletonMainMenuTopBar(),
            Expanded(
              child: Row(
                children: [
                  const SkeletonLeftMenuBar(),
                  Visibility(
                      visible: left.isOpen, child: const SkeletonLeftBody()),
                  const SkeletonRightBody(),
                  const SkeletonRightMenuBar(),
                ],
              ),
            ),
            const SkeletonMainMenuBottomBar()
          ],
        ),
      ),
    );
  }
}
