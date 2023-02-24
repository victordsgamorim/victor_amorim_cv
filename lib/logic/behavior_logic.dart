import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum MenuType { right, left }

class MenuBehaviour extends Equatable {
  final int index;
  final bool isOpen;

  const MenuBehaviour({this.index = 0, this.isOpen = true});

  MenuBehaviour copyWith({int? index, bool? isOpen}) {
    return MenuBehaviour(
        index: index ?? this.index, isOpen: isOpen ?? this.isOpen);
  }

  @override
  List<Object?> get props => [index, isOpen];
}

class BehaviourLogic {
  late final ValueNotifier<MenuBehaviour> leftBehaviour =
      ValueNotifier(const MenuBehaviour());

  late final ValueNotifier<MenuBehaviour> rightBehaviour =
      ValueNotifier(const MenuBehaviour());

  void onLeftTap({int? index}) {
    leftBehaviour.value = leftBehaviour.value.copyWith(
      isOpen: index == null
          ? false
          : (leftBehaviour.value.index == index
              ? !leftBehaviour.value.isOpen
              : true),
      index: index,
    );
  }
}
