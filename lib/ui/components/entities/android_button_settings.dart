import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AndroidButtonSettings extends Equatable {
  final String title;
  final String? tooltip;
  final Widget icon;

  const AndroidButtonSettings({
    required this.title,
    this.tooltip,
    required this.icon,
  });

  @override
  List<Object?> get props => [title, tooltip, icon];
}
