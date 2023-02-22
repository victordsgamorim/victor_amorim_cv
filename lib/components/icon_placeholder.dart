import 'package:flutter/material.dart';

class IconPlaceholder extends StatelessWidget {
  const IconPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 18,
      width: 18,
      child: Placeholder(
        color: Colors.white,
        strokeWidth: 1,
      ),
    );
  }
}
