import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:fluked/utils/local_storage.dart';

part 'fluked_state.dart';

class FlukedCubit extends Cubit<FlukedResult> {
  LocalStorage _localStorage = LocalStorage();
  FlukedCubit()
      : super(FlukedResult(
            random: 0,
            totalAttempts: LocalStorage().getTotalAttempts(),
            totalwinnings: LocalStorage().getTotalwins(),
            won: false));

  void checkWinner() async {
    _localStorage.increaseAttempts();
    int random = Random().nextInt(60);
    int secondsNow = DateTime.now().second;
    print("is $random = $secondsNow  ???");
    print(random == secondsNow);
    if (random == secondsNow) {
      await _localStorage.increaseWinning();
      emit(FlukedResult(
        random: random,
        totalAttempts: _localStorage.getTotalAttempts(),
        totalwinnings: _localStorage.getTotalwins(),
        won: true,
      ));
    } else {
      emit(FlukedResult(
        random: random,
        totalAttempts: _localStorage.getTotalAttempts(),
        totalwinnings: _localStorage.getTotalwins(),
        won: false,
      ));
    }
  }
}
