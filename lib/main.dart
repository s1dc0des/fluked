import 'package:fluked/constants/constants.dart';
import 'package:fluked/utils/local_storage.dart';
import 'package:fluked/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/fluked_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage().init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlukedCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fluked',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              bodyText2: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: mangnolla)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
