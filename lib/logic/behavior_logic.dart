import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum MenuType { right, left }

class MenuBehaviour extends Equatable {
  final int index;
  final bool isOpen;
  final FocusNode node;

  const MenuBehaviour(
      {required this.index, required this.isOpen, required this.node});

  factory MenuBehaviour.empty() {
    return MenuBehaviour(index: 0, isOpen: true, node: FocusNode());
  }

  MenuBehaviour copyWith({int? index, bool? isOpen}) {
    return MenuBehaviour(
      index: index ?? this.index,
      isOpen: isOpen ?? this.isOpen,
      node: node,
    );
  }

  @override
  List<Object?> get props => [index, isOpen];
}

class BehaviourLogic {
  late final ValueNotifier<Map<MenuType, MenuBehaviour>> behaviours =
      ValueNotifier({
    MenuType.left: MenuBehaviour.empty(),
    MenuType.right: MenuBehaviour.empty(),
  });

  void onTap(MenuType type, {int? index}) {
    final Map<MenuType, MenuBehaviour> updatedBehaviours =
        Map.from(behaviours.value);

    updatedBehaviours[type] = updatedBehaviours[type]!.copyWith(
      isOpen: index == null
          ? false
          : (updatedBehaviours[type]!.index == index
              ? !updatedBehaviours[type]!.isOpen
              : true),
      index: index,
    );

    behaviours.value = updatedBehaviours;
  }
}
