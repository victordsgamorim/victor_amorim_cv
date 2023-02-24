import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: ThemeColour.primaryColor[500],
  primarySwatch: ThemeColour.primaryColor,
  primaryColor: ThemeColour.primaryColor,
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 14, color: ThemeColour.primaryColor[100]),
  ),
  iconTheme: IconThemeData(color: ThemeColour.primaryColor[100]),
);
