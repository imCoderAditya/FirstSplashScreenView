import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  Color? colors;
  Widget? child;
  Icon? icon;
  Text? text;
  Widget? nextPage;
  Timer? timer;
  Gradient? gradient;
  AppBar? appBar;
  Color? appBarBackgroundColor;
  Duration? duration;

  SplashScreen({
    super.key,
    this.duration = const Duration(seconds: 5),
    this.child,
    this.colors = Colors.red,
    this.gradient,
    this.appBar,
    required this.nextPage,
    this.icon,
    this.timer,
    this.text,
  })  : assert(child == null ||
            appBar == null ||
            timer == null ||
            duration == null),
        assert(colors == null || icon == null);

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
      appBar: widget.appBar,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: widget.gradient,
              color: widget.colors,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: widget.child,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
