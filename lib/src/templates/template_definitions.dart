import 'package:flutter/material.dart';
import '../animations/logo_animations.dart';
import '../animations/text_animations.dart';
import '../backgrounds/animated_backgrounds.dart';
import '../indicators/loading_indicators.dart';
import '../models/splash_preset.dart';
import '../models/splash_template.dart';
import '../particles/particle_engine.dart';
import '../presets/preset_definitions.dart';

class TemplateDefinitions {
  static PresetConfig getTemplateConfig(SplashTemplate template) {
    switch (template) {
      // Tech & Corporate
      case SplashTemplate.apple:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.solid,
          colors: [Color(0xFF000000), Color(0xFF1C1C1E)],
          logoAnimation: LogoAnimationType.scale,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.dots,
          circleHeight: 100.0,
          iconBackgroundColor: Colors.white12,
        );

      case SplashTemplate.material3:
      case SplashTemplate.materialYou:
      case SplashTemplate.dynamicMonet:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: [Color(0xFF6750A4), Color(0xFF7D5260)],
          logoAnimation: LogoAnimationType.bounce,
          textAnimation: TextAnimationType.slide,
          indicatorType: LoadingIndicatorType.circular,
          circleHeight: 90.0,
          iconBackgroundColor: Colors.white24,
        );

      case SplashTemplate.glass:
      case SplashTemplate.liquidGlass:
      case SplashTemplate.glassmorphicOverlay:
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

      case SplashTemplate.cyberpunk:
      case SplashTemplate.neon:
      case SplashTemplate.futuristicHUD:
        return PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: const [
            Color(0xFF0F051D),
            Color(0xFF290025),
            Color(0xFF000000)
          ],
          logoAnimation: LogoAnimationType.flip,
          textAnimation: TextAnimationType.typewriter,
          indicatorType: LoadingIndicatorType.atom,
          particleType: ParticleType.fireflies,
          circleHeight: 95.0,
          iconBackgroundColor: Colors.pinkAccent.withValues(alpha: 0.3),
        );

      case SplashTemplate.ai:
      case SplashTemplate.space:
      case SplashTemplate.quantum:
      case SplashTemplate.cosmic:
        return PresetConfig(
          backgroundStyle: BackgroundStyle.aurora,
          colors: const [
            Color(0xFF0B0C10),
            Color(0xFF1F2833),
            Color(0xFF45A29E)
          ],
          logoAnimation: LogoAnimationType.pulse,
          textAnimation: TextAnimationType.typewriter,
          indicatorType: LoadingIndicatorType.orbit,
          particleType: ParticleType.stars,
          circleHeight: 100.0,
          iconBackgroundColor: Colors.cyanAccent.withValues(alpha: 0.2),
        );

      case SplashTemplate.gaming:
      case SplashTemplate.arcade:
        return PresetConfig(
          backgroundStyle: BackgroundStyle.animatedGradient,
          colors: const [
            Color(0xFF120E16),
            Color(0xFF2B003B),
            Color(0xFF120E16)
          ],
          logoAnimation: LogoAnimationType.rotation3D,
          textAnimation: TextAnimationType.scale,
          indicatorType: LoadingIndicatorType.atom,
          particleType: ParticleType.sparkles,
          circleHeight: 100.0,
          iconBackgroundColor: Colors.purpleAccent.withValues(alpha: 0.3),
        );

      case SplashTemplate.luxury:
      case SplashTemplate.gold:
      case SplashTemplate.diamond:
      case SplashTemplate.platinum:
        return PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: const [
            Color(0xFF111111),
            Color(0xFF1A1A1A),
            Color(0xFF000000)
          ],
          logoAnimation: LogoAnimationType.fade,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.dots,
          particleType: ParticleType.sparkles,
          circleHeight: 90.0,
          iconBackgroundColor: Colors.amber.withValues(alpha: 0.2),
        );

      case SplashTemplate.finance:
      case SplashTemplate.crypto:
      case SplashTemplate.security:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: [Color(0xFF0A192F), Color(0xFF112240), Color(0xFF020C1B)],
          logoAnimation: LogoAnimationType.scale,
          textAnimation: TextAnimationType.slide,
          indicatorType: LoadingIndicatorType.atom,
          circleHeight: 90.0,
          iconBackgroundColor: Colors.tealAccent,
        );

      case SplashTemplate.education:
      case SplashTemplate.saas:
      case SplashTemplate.developer:
      case SplashTemplate.corporate:
      case SplashTemplate.startup:
      case SplashTemplate.cloud:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: [Color(0xFF1A237E), Color(0xFF283593), Color(0xFF0D47A1)],
          logoAnimation: LogoAnimationType.scale,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.linear,
          circleHeight: 90.0,
          iconBackgroundColor: Colors.white24,
        );

      case SplashTemplate.healthcare:
      case SplashTemplate.medical:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.solid,
          colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
          logoAnimation: LogoAnimationType.pulse,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.circular,
          circleHeight: 85.0,
          iconBackgroundColor: Colors.green,
        );

      case SplashTemplate.food:
      case SplashTemplate.fire:
      case SplashTemplate.volcano:
        return PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: const [
            Color(0xFFD84315),
            Color(0xFFBF360C),
            Color(0xFF880E4F)
          ],
          logoAnimation: LogoAnimationType.bounce,
          textAnimation: TextAnimationType.scale,
          indicatorType: LoadingIndicatorType.dots,
          particleType: ParticleType.sparkles,
          circleHeight: 90.0,
          iconBackgroundColor: Colors.orangeAccent.withValues(alpha: 0.3),
        );

      case SplashTemplate.travel:
      case SplashTemplate.ocean:
      case SplashTemplate.sunrise:
      case SplashTemplate.aurora:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.aurora,
          colors: [Color(0xFF00695C), Color(0xFF00897B), Color(0xFF004D40)],
          logoAnimation: LogoAnimationType.floating,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.wave,
          particleType: ParticleType.bubbles,
          circleHeight: 95.0,
          iconBackgroundColor: Colors.tealAccent,
        );

      case SplashTemplate.nature:
      case SplashTemplate.forest:
      case SplashTemplate.leaves:
        return PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: const [
            Color(0xFF1B5E20),
            Color(0xFF2E7D32),
            Color(0xFF0D5302)
          ],
          logoAnimation: LogoAnimationType.floating,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.dots,
          particleType: ParticleType.leaves,
          circleHeight: 90.0,
          iconBackgroundColor: Colors.lightGreenAccent.withValues(alpha: 0.3),
        );

      case SplashTemplate.fireflies:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: [Color(0xFF0F0B1A), Color(0xFF1D162B)],
          logoAnimation: LogoAnimationType.pulse,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.dots,
          particleType: ParticleType.fireflies,
          circleHeight: 90.0,
        );

      case SplashTemplate.snow:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: [Color(0xFF1C2D42), Color(0xFF0E1A29)],
          logoAnimation: LogoAnimationType.fade,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.dots,
          particleType: ParticleType.snow,
          circleHeight: 90.0,
        );

      case SplashTemplate.rain:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.solid,
          colors: [Color(0xFF121B24)],
          logoAnimation: LogoAnimationType.slide,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.linear,
          particleType: ParticleType.rain,
          circleHeight: 85.0,
        );

      case SplashTemplate.atom:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: [Color(0xFF10101A), Color(0xFF1A1A2E)],
          logoAnimation: LogoAnimationType.rotation,
          textAnimation: TextAnimationType.typewriter,
          indicatorType: LoadingIndicatorType.atom,
          circleHeight: 95.0,
        );

      case SplashTemplate.orbit:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.gradient,
          colors: [Color(0xFF080711), Color(0xFF151428)],
          logoAnimation: LogoAnimationType.pulse,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.orbit,
          particleType: ParticleType.stars,
          circleHeight: 95.0,
        );

      case SplashTemplate.minimal:
      case SplashTemplate.light:
        return const PresetConfig(
          backgroundStyle: BackgroundStyle.solid,
          colors: [Color(0xFFFAFAFA)],
          logoAnimation: LogoAnimationType.scale,
          textAnimation: TextAnimationType.fade,
          indicatorType: LoadingIndicatorType.linear,
          circleHeight: 80.0,
          iconBackgroundColor: Colors.black12,
        );

      case SplashTemplate.dark:
      case SplashTemplate.midnight:
      case SplashTemplate.sunset:
      case SplashTemplate.gradient:
      case SplashTemplate.animated:
      case SplashTemplate.wave:
      case SplashTemplate.blob:
      case SplashTemplate.ripple:
      case SplashTemplate.particle:
      case SplashTemplate.glow:
      case SplashTemplate.shimmer:
      case SplashTemplate.typewriter:
      case SplashTemplate.flip:
      case SplashTemplate.rotation3d:
      case SplashTemplate.bounce:
      case SplashTemplate.morph:
      case SplashTemplate.zoom:
      case SplashTemplate.hero:
      case SplashTemplate.liquid:
      case SplashTemplate.mesh:
      case SplashTemplate.shader:
      case SplashTemplate.video:
      case SplashTemplate.lottie:
      case SplashTemplate.rive:
      case SplashTemplate.interactive:
      case SplashTemplate.countdown:
      case SplashTemplate.multiSequence:
      case SplashTemplate.adaptive:
      case SplashTemplate.sparkles:
      case SplashTemplate.bubbles:
      case SplashTemplate.stars:
      case SplashTemplate.magic:
      case SplashTemplate.infinity:
      case SplashTemplate.dna:
      case SplashTemplate.dots:
      case SplashTemplate.bars:
      case SplashTemplate.pulseWave:
      case SplashTemplate.shimmerText:
      case SplashTemplate.rollingText:
      case SplashTemplate.glowText:
      case SplashTemplate.gradientWave:
      case SplashTemplate.eCommerce:
      case SplashTemplate.fashion:
      case SplashTemplate.automotive:
      case SplashTemplate.logistics:
      case SplashTemplate.social:
      case SplashTemplate.music:
      case SplashTemplate.podcast:
      case SplashTemplate.news:
      case SplashTemplate.photography:
      case SplashTemplate.fitness:
      case SplashTemplate.event:
      case SplashTemplate.elegant:
      case SplashTemplate.vintage:
      case SplashTemplate.retro:
      case SplashTemplate.hologram:
      case SplashTemplate.metallic:
      case SplashTemplate.realEstate:
        return PresetDefinitions.getConfig(
          getPresetForTemplate(template),
        );
    }
  }

  static SplashPreset getPresetForTemplate(SplashTemplate template) {
    switch (template) {
      case SplashTemplate.apple:
        return SplashPreset.apple;
      case SplashTemplate.material3:
      case SplashTemplate.materialYou:
      case SplashTemplate.dynamicMonet:
        return SplashPreset.material3;
      case SplashTemplate.glass:
      case SplashTemplate.liquidGlass:
      case SplashTemplate.glassmorphicOverlay:
        return SplashPreset.liquidGlass;
      case SplashTemplate.cyberpunk:
      case SplashTemplate.neon:
      case SplashTemplate.futuristicHUD:
        return SplashPreset.cyberpunk;
      case SplashTemplate.gaming:
      case SplashTemplate.arcade:
        return SplashPreset.gaming;
      case SplashTemplate.ai:
      case SplashTemplate.space:
      case SplashTemplate.quantum:
      case SplashTemplate.cosmic:
        return SplashPreset.ai;
      case SplashTemplate.luxury:
      case SplashTemplate.gold:
      case SplashTemplate.diamond:
      case SplashTemplate.platinum:
        return SplashPreset.luxury;
      case SplashTemplate.minimal:
      case SplashTemplate.light:
        return SplashPreset.minimal;
      default:
        return SplashPreset.modern;
    }
  }
}
