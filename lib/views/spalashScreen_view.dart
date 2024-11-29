import 'dart:async';

import 'package:flutter/material.dart';

class SpalashscreenView extends StatefulWidget {
  const SpalashscreenView({super.key});

  @override
  State<SpalashscreenView> createState() => _SpalashscreenViewState();
}

class _SpalashscreenViewState extends State<SpalashscreenView> {
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer(Duration(milliseconds: 4000), () {
      Navigator.of(context).pushReplacementNamed('HomeView');
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0500ff),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Image.asset('assets/img/BeTalent.png'),
        )
      ),
    );
  }
}