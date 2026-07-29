import 'dart:async';
import 'package:flutter/material.dart';

import 'src/widgets/first_splash_screen_view.dart';

export 'src/animations/logo_animations.dart';
export 'src/animations/text_animations.dart';
export 'src/backgrounds/animated_backgrounds.dart';
export 'src/backgrounds/liquid_glass_bg.dart';
export 'src/controllers/splash_controller.dart';
export 'src/indicators/loading_indicators.dart';
export 'src/models/branding_kit.dart';
export 'src/models/splash_preset.dart';
export 'src/models/splash_template.dart';
export 'src/models/startup_checks.dart';
export 'src/particles/particle_engine.dart';
export 'src/presets/preset_definitions.dart';
export 'src/templates/template_definitions.dart';
export 'src/widgets/first_splash_screen_view.dart';

/// Legacy splash screen widget kept for 100% backward compatibility.
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
  Widget build(BuildContext context) {
    return FirstSplashScreenView(
      duration: widget.duration ?? const Duration(seconds: 5),
      nextPage: widget.nextPage,
      backgroundColor: widget.backgroundColor,
      gradient: widget.gradient,
      circleHeight: widget.circleHeight ?? 0,
      iconBackgroundColor: widget.iconBackgroundColor,
      text: widget.text,
      child: widget.child,
    );
  }
}
