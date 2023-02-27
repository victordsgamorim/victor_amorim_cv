import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:victor_amorim_portifolio/app_widget.dart';
import 'package:victor_amorim_portifolio/logic/behaviour/behavior_logic.dart';

void main() {
  registerSingletons();
  runApp(const AndroidStudioClone());
}

void registerSingletons() {
  GetIt.I.registerLazySingleton<BehaviourLogic>(() => BehaviourLogic());
}

BehaviourLogic get behaviourLogic => GetIt.I.get<BehaviourLogic>();

