import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static LocalStorage _instance = LocalStorage._internal();
  SharedPreferences preferences;

  factory LocalStorage() {
    return _instance;
  }

  init() async {
    preferences = await SharedPreferences.getInstance();
    return true;
  }

  LocalStorage._internal() {}

  removeKey(String keyname) {
    preferences.remove(keyname);
  }

  getTotalwins<int>() {
    print(preferences.containsKey('totalwins'));
    if (preferences.containsKey('totalwins')) {
      return preferences.getInt("totalwins");
    } else {
      return 0;
    }
  }

  increaseWinning() {
    int previousWins = getTotalwins();
    print("total wins are $previousWins");
    preferences.setInt('totalwins', previousWins + 1);
  }

  getTotalAttempts<int>() {
    if (preferences.containsKey('totalAttempts')) {
      return preferences.getInt('totalAttempts');
    } else {
      return 0;
    }
  }

  increaseAttempts() {
    int previousTotalAttempts = getTotalAttempts();
    preferences.setInt('totalAttempts', previousTotalAttempts + 1);
  }
}
