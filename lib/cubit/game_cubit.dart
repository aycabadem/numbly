import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayiciklar/cubit/game_state.dart';
import 'package:sayiciklar/models/tahmin.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState(tahmin: []));

  List<int> randomInt = randomNumber();
  void enter(Tahmin tahmin) {
    emit(state.copyWith(tahmin: tahmin));
  }

  void clear() {
    randomInt = randomNumber();
    emit(GameState(tahmin: []));
  }
}

List<int> randomNumber() {
  final List<int> randomNum = [];

  Random random = Random();

  for (int i = 0; i < 4; i++) {
    int random1 = random.nextInt(10);
    if (randomNum.contains(random1) || random1 == 0) {
      return randomNumber();
    }
    randomNum.add(random1);
  }
  debugPrint(randomNum.toString());
  return randomNum;
}
