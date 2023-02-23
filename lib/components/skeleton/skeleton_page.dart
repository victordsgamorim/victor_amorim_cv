import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_left_body.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_left_menu_bar.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_main_menu_bottom_bar.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_main_menu_top_bar.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_right_body.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_right_menu_bar.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_color.dart';

class AndroidStudio extends StatelessWidget {
  const AndroidStudio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColor.primaryColor[500],
        child: SafeArea(
          top: true,
          bottom: true,
          child: Column(
            children: [
              const SkeletonMainMenuTopBar(),
              Expanded(
                child: Row(
                  children: const [
                    SkeletonLeftMenuBar(),
                    SkeletonLeftBody(),
                    SkeletonRightBody(),
                    SkeletonRightMenuBar(),
                  ],
                ),
              ),
              const SkeletonMainMenuBottomBar()
            ],
          ),
        ),
      ),
    );
  }
}
