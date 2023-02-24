import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';

class RotatedSideButton extends StatefulWidget {
  final String title;
  final Widget icon;
  final int textQuarterTurns;
  final int iconQuarterTurns;
  final VoidCallback? onTap;

  const RotatedSideButton({
    super.key,
    required this.title,
    required this.icon,
    this.textQuarterTurns = 0,
    this.iconQuarterTurns = 0,
    this.onTap,
  });

  factory RotatedSideButton.clockwise({
    required String title,
    required Widget icon,
    VoidCallback? onTap,
  }) {
    return RotatedSideButton(
      title: title,
      icon: icon,
      textQuarterTurns: 1,
      iconQuarterTurns: 3,
      onTap: onTap,
    );
  }

  factory RotatedSideButton.antiClockwise({
    required String title,
    required Widget icon,
    VoidCallback? onTap,
  }) {
    return RotatedSideButton(
      title: title,
      icon: icon,
      textQuarterTurns: 3,
      iconQuarterTurns: 1,
      onTap: onTap,
    );
  }

  factory RotatedSideButton.none({
    required String title,
    required Widget icon,
    VoidCallback? onTap,
  }) {
    return RotatedSideButton(
      title: title,
      icon: icon,
      textQuarterTurns: 0,
      iconQuarterTurns: 0,
      onTap: onTap,
    );
  }

  @override
  State<RotatedSideButton> createState() => _RotatedSideButtonState();
}

class _RotatedSideButtonState extends State<RotatedSideButton> {
  final ValueNotifier<Color?> _containerColor =
      ValueNotifier(ThemeColour.primaryColor[500]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: RotatedBox(
        quarterTurns: widget.textQuarterTurns,
        child: MouseRegion(
          onEnter: (_) => _containerColor.value = ThemeColour.primaryColor[700],
          onExit: (_) => _containerColor.value = ThemeColour.primaryColor[500],
          child: ValueListenableBuilder(
              valueListenable: _containerColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: RotatedBox(
                            quarterTurns: widget.iconQuarterTurns ?? 0,
                            child: widget.icon),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: FittedBox(
                        fit: BoxFit.fitHeight, child: Text(widget.title)),
                  ),
                ],
              ),
              builder: (context, color, child) {
                return Container(
                  height: 20,
                  color: color,
                  child: child,
                );
              }),
        ),
      ),
    );
  }
}
