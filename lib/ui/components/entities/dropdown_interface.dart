import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class IDropdown extends Equatable {
  final Widget? icon;
  final Border? border;
  final String value;

  const IDropdown({
    required this.value,
    this.icon,
    this.border,
  });

  @override
  List<Object?> get props => [icon, value, border];
}

class AndroidDropdownItem extends IDropdown {
  const AndroidDropdownItem({required super.value, super.icon, super.border});
}
