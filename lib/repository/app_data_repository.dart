import 'package:fluked/modals/app_data.dart';
import 'package:fluked/utils/local_storage.dart';
import 'package:flutter/material.dart';

abstract class AppDataRepository {
  AppData getAppData();
}

class UserDataRepository extends AppDataRepository {
  LocalStorage _localStorage = LocalStorage();
  @override
  AppData getAppData() {
    return AppData(
      totalAttempts: _localStorage.getTotalAttempts(),
      totalFluked: _localStorage.getTotalFluked(),
    );
  }
}
