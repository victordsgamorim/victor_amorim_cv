import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';
import 'package:victor_amorim_portifolio/ui/components/android_large_button.dart';

class ElevatedButtonBorder extends StatelessWidget {
  final Widget icon;
  final String title;
  final bool isActivated;

  const ElevatedButtonBorder({
    super.key,
    required this.icon,
    required this.title,
    this.isActivated = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: ThemeColour.primaryColor[300]!),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
          child: Opacity(
            opacity: isActivated ? 1 : .3,
            child: Row(
              children: [
                AndroidLargeButton(
                  icon: icon,
                  title: title,
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ));
  }
}
