import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';

const _iconPadding = EdgeInsets.fromLTRB(4, 2, 4, 2);

class AndroidIconButton extends StatefulWidget {
  final Widget icon;
  final double? radius;
  final bool isActivated;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const AndroidIconButton({
    super.key,
    required this.icon,
    this.radius,
    this.isActivated = true,
    this.padding = _iconPadding,
    this.onTap,
  });

  factory AndroidIconButton.dot({
    required Widget icon,
    bool isActivated = true,
    double radius = 6,
    VoidCallback? onTap,
    EdgeInsets padding = _iconPadding
  }) {
    return AndroidIconButton(
      icon: icon,
      radius: radius,
      isActivated: isActivated,
      onTap: onTap,
      padding: padding,
    );
  }

  @override
  State<AndroidIconButton> createState() => _AndroidIconButtonState();
}

class _AndroidIconButtonState extends State<AndroidIconButton> {
  late final ValueNotifier<Color?> _colorController;

  @override
  void initState() {
    super.initState();
    _colorController = ValueNotifier<Color?>(ThemeColour.primaryColor[500]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: widget.padding,
        child: IgnorePointer(
          ignoring: !widget.isActivated,
          child: MouseRegion(
            onEnter: (_) => _colorController.value =
                ThemeColour.primaryColor[300]!.withOpacity(0.4),
            onExit: (_) => _colorController.value = Colors.transparent,
            child: ValueListenableBuilder(
                valueListenable: _colorController,
                child: widget.radius != null
                    ? _DropDot(icon: widget.icon, radius: widget.radius!)
                    : widget.icon,
                builder: (_, color, child) {
                  return Container(
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(2),
                        )),
                    child: FittedBox(fit: BoxFit.fitHeight, child: child),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class _DropDot extends StatelessWidget {
  final double radius;
  final Widget icon;

  const _DropDot({super.key, required this.icon, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        icon,
        Positioned(
            bottom: 3,
            right: 3,
            child: Container(
              height: radius,
              width: radius,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(color: Colors.black)),
              child: Container(),
            ))
      ],
    );
  }
}
