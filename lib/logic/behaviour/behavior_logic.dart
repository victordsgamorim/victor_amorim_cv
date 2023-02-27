import 'package:flutter/cupertino.dart';
import 'package:victor_amorim_portifolio/logic/behaviour/behaviour.dart';

class BehaviourLogic {
  late final ValueNotifier<Map<MenuType, MenuBehaviour>> behaviours =
      ValueNotifier({
    MenuType.left: MenuBehaviour.empty(),
    MenuType.right: MenuBehaviour.empty().copyWith(isOpen: false, focus: false),
    MenuType.bottom:
        MenuBehaviour.empty().copyWith(isOpen: false, focus: false),
  });

  void onTap(MenuType type, {int? index}) {
    Map<MenuType, MenuBehaviour> updatedBehaviours = Map.from(behaviours.value);

    updatedBehaviours[type] = updatedBehaviours[type]!.copyWith(
      isOpen: index == null
          ? false
          : (updatedBehaviours[type]!.index == index
              ? !updatedBehaviours[type]!.isOpen
              : true),
      index: index,
    );

    updatedBehaviours = _controlFocus(type, updatedBehaviours);
    behaviours.value = updatedBehaviours;
  }

  Map<MenuType, MenuBehaviour> _controlFocus(
      MenuType type, Map<MenuType, MenuBehaviour> menus) {
    if (!menus[type]!.node.hasFocus) {
      print('ESTOU AQUI ${type} ${!menus[type]!.node.hasFocus}');
      // final focusedMenu =
      //     menus.keys.firstWhere((type) => menus[type]!.node.hasFocus == true);

      // menus[focusedMenu] = menus[focusedMenu]!.copyWith(hasFocus: false);
      // menus[type] = menus[type]!.copyWith(hasFocus: true);
    }

    return menus;
  }
}
