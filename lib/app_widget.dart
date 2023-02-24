import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme.dart';
import 'package:victor_amorim_portifolio/ui/skeleton/skeleton_page.dart';

class AndroidStudioClone extends StatelessWidget {
  const AndroidStudioClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Android Studio Clone',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: AndroidStudio(),
    );
  }
}
