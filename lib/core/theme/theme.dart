import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_color.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  primarySwatch: ThemeColor.primaryColor,
  primaryColor: ThemeColor.primaryColor,
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 14, color: ThemeColor.primaryColor[100]),
  ),
  iconTheme: IconThemeData(color: ThemeColor.primaryColor[100]),
);
