import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/components/skeleton/skeleton_page.dart';
import 'package:victor_amorim_portifolio/core/theme/theme.dart';

class AndroidStudioClone extends StatelessWidget {
  const AndroidStudioClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Android Studio Clone',
      theme: theme,
      // debugShowCheckedModeBanner: kDebugMode,
      debugShowCheckedModeBanner: false,
      home: const AndroidStudio(),
    );
  }
}
