import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/ui/components/android_icon_button.dart';

class AndroidLargeButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final double height;

  const AndroidLargeButton({
    super.key,
    required this.icon,
    required this.title,
    this.height = 25,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            AndroidIconButton(
              icon: icon,
              isActivated: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(title),
            )
          ],
        ),
      ),
    );
  }
}
