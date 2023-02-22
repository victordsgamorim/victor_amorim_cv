import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/components/icon_placeholder.dart';

class RotatedSideButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final int quarterTurns;

  const RotatedSideButton({
    super.key,
    required this.title,
    required this.icon,
    required this.quarterTurns,
  });

  factory RotatedSideButton.clockwise({
    required String title,
    required IconData icon,
    required int quarterTurns,
  }) {
    return RotatedSideButton(
      title: title,
      icon: icon,
      quarterTurns: 1,
    );
  }

  factory RotatedSideButton.antiClockwise({
    required String title,
    required IconData icon,
    required int quarterTurns,
  }) {
    return RotatedSideButton(
      title: title,
      icon: icon,
      quarterTurns: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: IconPlaceholder(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
