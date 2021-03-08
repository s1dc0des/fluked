import 'package:fluked/utils/local_storage.dart';
import 'package:fluked/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/fluked_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlukedCubit(),
      child: MaterialApp(
        title: 'Fluked',
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
