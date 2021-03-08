import 'dart:async';

import 'package:fluked/constants/constants.dart';
import 'package:fluked/cubit/fluked_cubit.dart';
import 'package:fluked/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  LocalStorage _localStorage = LocalStorage();
  // final String currentTime = getSystemTime();

  // String getSystemTime() {
  //   var now = DateTime.now();
  //   return DateFormat("H:m:s").format(now);
  // }

  @override
  void initState() {
    super.initState();
  }

  void vibrate() async {
    if (await Vibration.hasCustomVibrationsSupport()) {
      Vibration.vibrate(duration: 200);
      await Future.delayed(Duration(milliseconds: 100));
      Vibration.vibrate(duration: 300);
    }
  }

  void vibrateSmall() async {
    if (await Vibration.hasCustomVibrationsSupport()) {
      Vibration.vibrate(duration: 50);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: independence,
      appBar: AppBar(
        title: Text(
          "Fluked",
          style: TextStyle(color: honeyYellow, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: jet,
      ),
      body: Center(
        child: BlocConsumer<FlukedCubit, FlukedResult>(
          listener: (context, state) {
            if (state.won) {
              vibrate();
            } else {}
          },
          builder: (context, state) {
            final Size size = MediaQuery.of(context).size;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        color: jet,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Total attempts = ${state.totalAttempts.toString()}",
                                style: TextStyle(fontSize: 12, color: mangnolla),
                              ),
                            ),
                            Text(
                              "Total Fluked = ${state.totalwinnings.toString()}",
                              style: TextStyle(fontSize: 22, color: mangnolla),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                                DateTime now = DateTime.now();
                                String time = DateFormat("H:m:").format(now);
                                String timeseconds = DateFormat("s").format(now);

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$time",
                                      style: TextStyle(color: mangnolla, fontSize: 40, fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "$timeseconds",
                                      style: TextStyle(color: honeyYellow, fontSize: 40, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        )),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0, right: 12.0, left: 12.0, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<FlukedCubit>(context).checkWinner();
                            vibrateSmall();
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            color: jet,
                            child: Container(
                              width: size.width / 2 - 24,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (!state.won) ...[
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.refresh,
                                        size: 30,
                                        color: mangnolla,
                                      ),
                                    ),
                                    Text(
                                      "Try again",
                                    ),
                                  ],
                                  if (state.won) ...[
                                    Text(
                                      "You won !!!",
                                    )
                                  ]
                                ],
                              )),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            color: Colors.amber,
                            child: Container(
                              width: size.width / 2 - 24,
                              child: Center(
                                  child: Text(
                                state.random.toString(),
                                style: TextStyle(color: jet, fontSize: 40),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
