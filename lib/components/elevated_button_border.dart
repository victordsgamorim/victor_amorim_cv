import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_color.dart';

class ElevatedButtonBorder extends StatelessWidget {
  final Widget icon;
  final List<String> titles;
  final bool isActivated;

  const ElevatedButtonBorder({
    super.key,
    required this.icon,
    required this.titles,
    this.isActivated = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: ThemeColor.primaryColor[300]!),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 3, 4, 3),
          child: Opacity(
            opacity: isActivated ? 1 : .3,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: FittedBox(
                    child: icon,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(titles[0]),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ));
  }
}
