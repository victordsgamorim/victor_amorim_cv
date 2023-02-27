import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';

class SkeletonBottomBody extends StatefulWidget {
  const SkeletonBottomBody({super.key});

  @override
  State<SkeletonBottomBody> createState() => _SkeletonBottomBodyState();
}

class _SkeletonBottomBodyState extends State<SkeletonBottomBody> {
  late final Color? lightColor;
  late final Color? darkColor;
  late final ValueNotifier<double> _heightController;

  @override
  void initState() {
    super.initState();
    lightColor = ThemeColour.primaryColor[500];
    darkColor = ThemeColour.primaryColor[800];
    _heightController = ValueNotifier<double>(0.0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _heightController.value = MediaQuery.of(context).size.height * .25;
    });
  }

  @override
  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * .1;
    double maxHeight = MediaQuery.of(context).size.height * .8;

    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.resizeUpDown,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              _heightController.value =
                  (_heightController.value - details.delta.dy)
                      .clamp(minHeight, maxHeight);
            },
            child: Container(
              height: 28,
              decoration: BoxDecoration(
                color: ThemeColour.barColour,
                border: Border.all(color: ThemeColour.primaryColor[800]!),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Text('Run:'),
                    const SizedBox(width: 15),
                    Container(
                      height: 23,
                      color: ThemeColour.primaryColor[200],
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Container(
                          decoration:
                              const BoxDecoration(color: ThemeColour.barColour),
                          child: Row(
                            children: [
                              const FlutterLogo(),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text('main.dart'),
                              ),
                              Icon(
                                Icons.close,
                                size: 15,
                                color: ThemeColour.primaryColor[200]!,
                              ),
                              const SizedBox(width: 5)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
          child: ValueListenableBuilder(
            valueListenable: _heightController,
            builder: (_, height, __) => Container(
                height: height,
                width: MediaQuery.of(context).size.width,
                color: ThemeColour.primaryColor[500]),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _heightController.dispose();
  }
}
