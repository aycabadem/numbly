import 'package:equatable/equatable.dart';

class Tahmin extends Equatable {
  int? sayi;
  int? tur;
  int? artiBir;
  int? eskiBir;
  Tahmin({
    this.sayi,
    this.tur,
    this.artiBir,
    this.eskiBir,
  });

  @override
  List<Object?> get props => [sayi, tur, eskiBir, artiBir];
}
