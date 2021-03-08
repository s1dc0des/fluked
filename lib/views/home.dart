import 'dart:async';

import 'package:fluked/cubit/fluked_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluked"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<FlukedCubit, FlukedResult>(
          listener: (context, state) {},
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
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(state.won ? "Won" : "Lost"),
                              Text(state.totalAttempts.toString()),
                              Text(state.totalwinnings.toString()),
                            ],
                          ),
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
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            color: Colors.green,
                            child: Container(
                              width: size.width / 2 - 24,
                              child: Center(child: Text("Press me")),
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
                              child: Center(child: Text(state.random.toString())),
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
