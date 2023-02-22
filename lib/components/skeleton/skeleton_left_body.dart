import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/components/icon_placeholder.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_head_tab.dart';
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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _widthController =
        ValueNotifier<double>(MediaQuery.of(context).size.width * .2);
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
            SkeletonHeadTab(
              width: width,
              children: [
                Row(
                  children: const [
                    IconPlaceholder(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text("Project"),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    ...List.generate(
                        3,
                        (index) => const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: IconPlaceholder(),
                            )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      child: VerticalDivider(
                        color: ThemeColor.primaryColor[400],
                        width: 1,
                      ),
                    ),
                    ...List.generate(
                        2,
                        (index) => Padding(
                              padding: EdgeInsets.only(
                                  right: index != 1 ? 10.0 : 0,
                                  left: index == 0 ? 5 : 0),
                              child: const IconPlaceholder(),
                            ))
                  ],
                ),
              ],
            ),
            Container(color: ThemeColor.primaryColor[500]),
          ],
        ));
  }
}
