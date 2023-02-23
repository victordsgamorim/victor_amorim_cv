import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/components/android_icon_button.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_menu_top_bar.dart';
import 'package:victor_amorim_portifolio/components/vertical_divider_v2.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_color.dart';

class SkeletonLeftBody extends StatefulWidget {
  const SkeletonLeftBody({super.key});

  @override
  State<SkeletonLeftBody> createState() => _SkeletonLeftBodyState();
}

class _SkeletonLeftBodyState extends State<SkeletonLeftBody> {
  late final Color? lightColor;
  late final Color? darkColor;
  late final ValueNotifier<double> _widthController;

  @override
  void initState() {
    super.initState();
    lightColor = ThemeColor.primaryColor[500];
    darkColor = ThemeColor.primaryColor[800];
    _widthController = ValueNotifier<double>(0.0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _widthController.value = MediaQuery.of(context).size.width * .2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * .1,
            maxWidth: MediaQuery.of(context).size.width * .8,
          ),
          child: ValueListenableBuilder(
              valueListenable: _widthController,
              builder: (context, width, child) {
                return _SideContent(width: width);
              }),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.resizeLeftRight,
          child: GestureDetector(
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              _widthController.value =
                  (_widthController.value + details.delta.dx).clamp(
                      MediaQuery.of(context).size.width * .1,
                      MediaQuery.of(context).size.width * .8);
            },
            child: Container(color: lightColor, width: 2),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _widthController.dispose();
  }
}

class _SideContent extends StatelessWidget {
  final double width;

  const _SideContent({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: width,
        color: ThemeColor.primaryColor[500],
        child: Column(
          children: [
            SkeletonMenuTopBar(
              width: width,
              border: Border(
                  bottom: BorderSide(color: ThemeColor.primaryColor[800]!)),
              leftChildren: const [
                AndroidIconButton(
                  icon: Icon(Icons.desktop_windows,),
                  isActivated: false,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text("Project"),
                ),
                Icon(Icons.arrow_drop_down)
              ],
              rightChildren: const [
                AndroidIconButton(icon: Icon(Icons.circle_outlined)),
                AndroidIconButton(icon: Icon(Icons.unfold_more)),
                AndroidIconButton(icon: Icon(Icons.unfold_less)),
                VerticalDividerV2(),
                AndroidIconButton(icon: Icon(Icons.settings)),
                AndroidIconButton(icon: Icon(Icons.remove))
              ],
            ),
            Container(color: ThemeColor.primaryColor[500]),
          ],
        ));
  }
}
