import 'package:equatable/equatable.dart';

import 'package:sayiciklar/cubit/game_cubit.dart';
import 'package:sayiciklar/models/tahmin.dart';

class GameState extends Equatable {
  final List<Tahmin> tahmin;

  const GameState({required this.tahmin});
  @override
  List<Object?> get props => [tahmin];

  GameState copyWith({
    required Tahmin tahmin,
  }) {
    return GameState(
      tahmin: this.tahmin + [tahmin],
    );
  }
}
