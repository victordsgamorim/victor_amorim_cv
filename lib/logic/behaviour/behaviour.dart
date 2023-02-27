import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum MenuType { right, left, bottom }

class MenuBehaviour extends Equatable {
  final int index;
  final bool isOpen;
  final FocusNode node;

  const MenuBehaviour(
      {required this.index, required this.isOpen, required this.node});

  factory MenuBehaviour.empty() {
    return MenuBehaviour(index: 0, isOpen: true, node: FocusNode());
  }

  MenuBehaviour copyWith({
    int? index,
    bool? isOpen,
    bool focus = true,
  }) {
    if (focus) {
      node.requestFocus();
    } else {
      node.unfocus();
    }
    return MenuBehaviour(
      index: index ?? this.index,
      isOpen: isOpen ?? this.isOpen,
      node: node,
    );
  }

  @override
  List<Object?> get props => [index, isOpen, node];
}
