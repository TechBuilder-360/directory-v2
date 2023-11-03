import 'dart:async';

import 'package:biz_directory/screens/authentication/index.dart';
import 'package:flutter/material.dart';
import 'package:biz_directory/screens/authentication/index.dart';
import 'package:go_router/go_router.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      timer.cancel();
      context.go('/auth');
    });

    return const Scaffold(
      body: Center(
          child: Image(
        image: AssetImage("assets/images/office.png"),
        width: 200,
        height: 200,
      )),
    );
  }
}
