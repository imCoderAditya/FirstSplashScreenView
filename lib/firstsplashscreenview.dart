import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  Widget? child;
  Color? iconBackgroundColor;
  Text? text;
  Widget? nextPage;
  Timer? timer;
  Gradient? gradient;
  Color? backgroundColor;
  Duration? duration;
  double? circleHeight;

  SplashScreen({
    super.key,
    this.duration = const Duration(seconds: 5),
    required this.nextPage,
    this.circleHeight = 0,
    this.iconBackgroundColor,
    this.backgroundColor,
    this.timer,
    this.child,
    this.text,
  });

  SplashScreen.gradient({
    super.key,
    this.duration = const Duration(seconds: 5),
    this.gradient,
    required this.nextPage,
    this.circleHeight = 0,
    this.iconBackgroundColor,
    this.timer,
    this.child,
    this.text,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(widget.duration!, () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => widget.nextPage!,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: widget.gradient,
            color: widget.backgroundColor,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: widget.circleHeight,
                  width: widget.circleHeight,
                  decoration: BoxDecoration(
                    color: widget.iconBackgroundColor,
                    borderRadius:
                        BorderRadius.circular(widget.circleHeight! / 2),
                  ),
                  child: widget.child,
                ),
                const SizedBox(
                  height: 20,
                ),
                widget.text!,
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
