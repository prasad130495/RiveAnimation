import 'dart:ui';
import 'package:rive/rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double percentage = 0;
  late RiveAnimationController riveController;
  String message = "Loading...";

  @override
  void initState() {
    super.initState();
    riveController = SimpleAnimation('Animation 1');
    riveController.isActive = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff000F17),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                width: 500,
                child: RiveAnimation.network(
                  'https://public.rive.app/community/runtime-files/410-767-power-button.riv',
                  //'https://public.rive.app/community/runtime-files/186-341-flame-and-spark.riv'

                  controllers: [riveController],
// Update the play state when the widget's initialized
                  onInit: (_) => setState(() {}),
                ),
              ),
              SizedBox(height: 25),
              Text(
                message,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Helvetica',
                  color: Color(0xff85F513),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
