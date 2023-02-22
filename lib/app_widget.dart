import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_page.dart';

class VictorAmorimCV extends StatelessWidget {
  const VictorAmorimCV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const ResizeContainer(),
    );
  }
}
