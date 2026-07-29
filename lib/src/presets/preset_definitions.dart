import 'package:flutter/material.dart';
import '../animations/logo_animations.dart';
import '../animations/text_animations.dart';
import '../backgrounds/animated_backgrounds.dart';
import '../indicators/loading_indicators.dart';
import '../models/splash_preset.dart';
import '../particles/particle_engine.dart';

class PresetConfig {
  final BackgroundStyle backgroundStyle;
  final List<Color> colors;
  final LogoAnimationType logoAnimation;
  final TextAnimationType textAnimation;
  final LoadingIndicatorType indicatorType;
  final ParticleType? particleType;
  final double circleHeight;
  final Color? iconBackgroundColor;

  const PresetConfig({
    required this.backgroundStyle,
    required this.colors,
    required this.logoAnimation,
    required this.textAnimation,
    required this.indicatorType,
    this.particleType,
    this.circleHeight = 90.0,
    this.iconBackgroundColor,
  });
}

class PresetDefinitions {
  static PresetConfig getConfig(SplashPreset preset) {
    switch (preset) {
      case SplashPreset.apple:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.solid,
          colors: [Color(0xFF000000), Color(0xFF1C1C1E)],
          logoAnimation: LogoAnimationType.scale,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.dots,
          circleHeight: 100.0,
          iconBackgroundColor: Colors.white12,
        );

      case SplashPreset.material3:
      case SplashPreset.materialYou:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: [Color(0xFF6750A4), Color(0xFF7D5260)],
          logoAnimation: LogoAnimationType.bounce,
          textAnimation: TextAnimationType.slide,
          indicatorType: LoadingIndicatorType.circular,
          circleHeight: 90.0,
          iconBackgroundColor: Colors.white24,
        );

      case SplashPreset.liquidGlass:
      case SplashPreset.glass:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.aurora,
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)],
          logoAnimation: LogoAnimationType.pulse,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.orbit,
          particleType: ParticleType.sparkles,
          circleHeight: 110.0,
          iconBackgroundColor: Colors.white24,
        );

      case SplashPreset.cyberpunk:
      case SplashPreset.neon:
        return PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: const [Color(0xFF0F051D), Color(0xFF290025), Color(0xFF000000)],
          logoAnimation: LogoAnimationType.flip,
          textAnimation: TextAnimationType.typewriter,
          indicatorType: LoadingIndicatorType.atom,
          particleType: ParticleType.fireflies,
          circleHeight: 95.0,
          iconBackgroundColor: Colors.pinkAccent.withValues(alpha: 0.3),
        );

      case SplashPreset.gaming:
        return PresetConfig(
          backgroundStyle: BackgroundStyle.animatedGradient,
          colors: const [Color(0xFF120E16), Color(0xFF2B003B), Color(0xFF120E16)],
          logoAnimation: LogoAnimationType.rotation3D,
          textAnimation: TextAnimationType.scale,
          indicatorType: LoadingIndicatorType.atom,
          particleType: ParticleType.sparkles,
          circleHeight: 100.0,
          iconBackgroundColor: Colors.purpleAccent.withValues(alpha: 0.3),
        );

      case SplashPreset.ai:
      case SplashPreset.space:
        return PresetConfig(
          backgroundStyle: BackgroundStyle.aurora,
          colors: const [Color(0xFF0B0C10), Color(0xFF1F2833), Color(0xFF45A29E)],
          logoAnimation: LogoAnimationType.pulse,
          textAnimation: TextAnimationType.typewriter,
          indicatorType: LoadingIndicatorType.orbit,
          particleType: ParticleType.stars,
          circleHeight: 100.0,
          iconBackgroundColor: Colors.cyanAccent.withValues(alpha: 0.2),
        );

      case SplashPreset.luxury:
        return PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: const [Color(0xFF111111), Color(0xFF1A1A1A), Color(0xFF000000)],
          logoAnimation: LogoAnimationType.fade,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.dots,
          particleType: ParticleType.sparkles,
          circleHeight: 90.0,
          iconBackgroundColor: Colors.amber.withValues(alpha: 0.2),
        );

      case SplashPreset.minimal:
      case SplashPreset.light:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.solid,
          colors: [Color(0xFFFAFAFA)],
          logoAnimation: LogoAnimationType.scale,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.linear,
          circleHeight: 80.0,
          iconBackgroundColor: Colors.black12,
        );

      case SplashPreset.modern:
      case SplashPreset.gradient:
      default:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.animatedGradient,
          colors: [Color(0xFF6C5CE7), Color(0xFFA29BFE), Color(0xFF00CEC9)],
          logoAnimation: LogoAnimationType.scale,
          textAnimation: TextAnimationType.slide,
          indicatorType: LoadingIndicatorType.circular,
          circleHeight: 90.0,
          iconBackgroundColor: Colors.white24,
        );
    }
  }
}
