import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayiciklar/cubit/game_state.dart';
import 'package:sayiciklar/models/tahmin.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState(tahmin: []));

  void enter(Tahmin tahmin) {
    emit(state.copyWith(tahmin: tahmin));
  }
}
