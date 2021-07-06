import 'dart:async';

import 'package:fl_mvvm_riverpod/app/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  SplashView();

  @override
  State<StatefulWidget> createState() {
    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView> {
  static const timeout = const Duration(seconds: 5);

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    transition();
  }

  void transition() {
    Timer(timeout, () {
      Navigator.of(context).pushNamedAndRemoveUntil(RoutePaths.welcomeView, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Lang Trainer", style: Theme.of(context).primaryTextTheme.headline1,),
          ),
        ),
        width: 200,
        height: 200,
      ),
    );
  }
}
