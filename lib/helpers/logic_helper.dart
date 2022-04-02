class LogicHelper {
  final List<int> random;
  final List<int> chosen;

  LogicHelper(this.random, this.chosen);
  int arti() {
    int artiBir = 0;
    int i;
    for (i = 0; i < 4; i++) {
      if (random[i] == chosen[i]) {
        artiBir++;
      }
    }

    return artiBir;
  }

  int eksi() {
    int eksiBir = 0;
    for (int i = 0; i < 4; i++) {
      if (random.contains(chosen[i])) {
        if (random[i] != chosen[i]) {
          eksiBir--;
        }
      }
    }

    return eksiBir;
  }
}
