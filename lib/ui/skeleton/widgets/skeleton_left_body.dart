import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';
import 'package:victor_amorim_portifolio/main.dart';
import 'package:victor_amorim_portifolio/ui/components/android_dropdown.dart';
import 'package:victor_amorim_portifolio/ui/components/android_icon_button.dart';
import 'package:victor_amorim_portifolio/ui/components/android_large_button.dart';
import 'package:victor_amorim_portifolio/ui/components/entities/dropdown_interface.dart';
import 'package:victor_amorim_portifolio/ui/components/vertical_divider_v2.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/widgets/skeleton_menu_horizontal_bar.dart';

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
    lightColor = ThemeColour.primaryColor[500];
    darkColor = ThemeColour.primaryColor[800];
    _widthController = ValueNotifier<double>(0.0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _widthController.value = MediaQuery.of(context).size.width * .25;
    });
  }

  @override
  Widget build(BuildContext context) {
    double minWidth = MediaQuery.of(context).size.width * .1;
    double maxWidth = MediaQuery.of(context).size.width * .8;

    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: minWidth, maxWidth: maxWidth),
          child: ValueListenableBuilder(
              valueListenable: _widthController,
              builder: (_, width, __) => _SideContent(width: width)),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.resizeLeftRight,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              _widthController.value =
                  (_widthController.value + details.delta.dx)
                      .clamp(minWidth, maxWidth);
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
        color: ThemeColour.primaryColor[500],
        child: Column(
          children: [
            SkeletonMenuHorizontalBar(
              width: width,
              border: Border(
                  bottom: BorderSide(color: ThemeColour.primaryColor[800]!)),
              leftChildren: [
                AndroidDropdown<AndroidDropdownItem>(
                  items: const [
                    AndroidDropdownItem(
                        value: 'Project', icon: Icon(Icons.settings_display)),
                    AndroidDropdownItem(
                        value: 'Packages', icon: Icon(Icons.folder_copy)),
                    AndroidDropdownItem(
                        value: 'Project Files', icon: Icon(Icons.folder)),
                    AndroidDropdownItem(
                        value: 'Production',
                        icon: Icon(Icons.settings_applications)),
                    AndroidDropdownItem(
                        value: 'Test',
                        icon: Icon(Icons.transit_enterexit_sharp)),
                    AndroidDropdownItem(
                        value: 'Project Source Files',
                        icon: Icon(Icons.folder)),
                    AndroidDropdownItem(
                        value: 'Project Non-Source Files',
                        icon: Icon(Icons.folder)),
                    AndroidDropdownItem(
                        value: 'Open Files', icon: Icon(Icons.folder)),
                    AndroidDropdownItem(
                        value: 'All Changed Files',
                        icon: Icon(Icons.account_tree_sharp)),
                    AndroidDropdownItem(
                        value: 'Scratches and Consoles',
                        icon: Icon(Icons.terminal)),
                    AndroidDropdownItem(
                        value: 'Android', icon: Icon(Icons.android)),
                  ],
                  headBuilder: (AndroidDropdownItem item) {
                    return Row(
                      children: [
                        AndroidLargeButton(
                          icon: item.icon!,
                          title: item.value,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    );
                  },
                  itemBuilder: (_, AndroidDropdownItem item) {
                    return AndroidLargeButton(
                      icon: item.icon!,
                      title: item.value,
                    );
                  },
                )
              ],
              rightChildren: [
                const AndroidIconButton(
                    padding: EdgeInsets.all(3.5),
                    icon: Icon(Icons.circle_outlined)),
                const AndroidIconButton(icon: Icon(Icons.unfold_more)),
                const AndroidIconButton(icon: Icon(Icons.unfold_less)),
                const VerticalDividerV2(),
                const AndroidIconButton(icon: Icon(Icons.settings)),
                AndroidIconButton(
                  icon: const Icon(Icons.remove),
                  onTap: behaviourLogic.onLeftTap,
                )
              ],
            ),
            Container(color: ThemeColour.primaryColor[500]),
          ],
        ));
  }
}
