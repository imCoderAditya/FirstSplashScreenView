import 'package:flutter/material.dart';
import '../animations/logo_animations.dart';
import '../animations/text_animations.dart';
import '../backgrounds/animated_backgrounds.dart';
import '../backgrounds/liquid_glass_bg.dart';
import '../controllers/splash_controller.dart';
import '../indicators/loading_indicators.dart';
import '../models/branding_kit.dart';
import '../models/splash_preset.dart';
import '../models/splash_template.dart';
import '../models/startup_checks.dart';
import '../particles/particle_engine.dart';
import '../presets/preset_definitions.dart';
import '../templates/template_definitions.dart';

/// The modern, feature-rich flagship Splash Screen view widget for Flutter.
class FirstSplashScreenView extends StatefulWidget {
  final SplashPreset? preset;
  final SplashTemplate? template;
  final Duration duration;
  final Widget? nextPage;
  final Widget? child;
  final Text? text;
  final String? titleText;
  final TextStyle? textStyle;
  final Gradient? gradient;
  final Color? backgroundColor;
  final List<Color>? colors;
  final double circleHeight;
  final Color? iconBackgroundColor;
  final BrandingKit? brandingKit;
  final StartupChecks? startupChecks;
  final ParticleType? particleType;
  final List<Color>? particleColors;
  final LoadingIndicatorType? indicatorType;
  final LogoAnimationType? logoAnimationType;
  final TextAnimationType? textAnimationType;
  final VoidCallback? onStarted;
  final VoidCallback? onCompleted;
  final WidgetBuilder? customBuilder;
  final WidgetBuilder? lottieBuilder;
  final WidgetBuilder? riveBuilder;
  final WidgetBuilder? videoBuilder;

  const FirstSplashScreenView({
    super.key,
    this.preset,
    this.template,
    this.duration = const Duration(seconds: 3),
    this.nextPage,
    this.child,
    this.text,
    this.titleText,
    this.textStyle,
    this.gradient,
    this.backgroundColor,
    this.colors,
    this.circleHeight = 90.0,
    this.iconBackgroundColor,
    this.brandingKit,
    this.startupChecks,
    this.particleType,
    this.particleColors,
    this.indicatorType,
    this.logoAnimationType,
    this.textAnimationType,
    this.onStarted,
    this.onCompleted,
    this.customBuilder,
    this.lottieBuilder,
    this.riveBuilder,
    this.videoBuilder,
  });

  /// Factory constructor for gradient splash screens.
  factory FirstSplashScreenView.gradient({
    Key? key,
    required Gradient gradient,
    required Widget nextPage,
    Duration duration = const Duration(seconds: 3),
    double circleHeight = 90.0,
    Color? iconBackgroundColor,
    Widget? child,
    Text? text,
  }) {
    return FirstSplashScreenView(
      key: key,
      gradient: gradient,
      nextPage: nextPage,
      duration: duration,
      circleHeight: circleHeight,
      iconBackgroundColor: iconBackgroundColor,
      text: text,
      child: child,
    );
  }

  @override
  State<FirstSplashScreenView> createState() => _FirstSplashScreenViewState();
}

class _FirstSplashScreenViewState extends State<FirstSplashScreenView> {
  late SplashController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SplashController(
      duration: widget.duration,
      nextPage: widget.nextPage,
      startupChecks: widget.startupChecks,
      onStarted: widget.onStarted,
      onCompleted: widget.onCompleted,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.start(context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.customBuilder != null) {
      return Scaffold(body: widget.customBuilder!(context));
    }

    final presetConfig = widget.template != null
        ? TemplateDefinitions.getTemplateConfig(widget.template!)
        : PresetDefinitions.getConfig(widget.preset ?? SplashPreset.modern);

    final effectiveBackgroundStyle =
        (widget.gradient != null || widget.colors != null)
            ? BackgroundStyle.gradient
            : (widget.backgroundColor != null
                ? BackgroundStyle.solid
                : presetConfig.backgroundStyle);

    final effectiveColors = widget.colors ??
        (widget.gradient != null && widget.gradient is LinearGradient
            ? (widget.gradient as LinearGradient).colors
            : presetConfig.colors);

    final effectiveParticleType =
        widget.particleType ?? presetConfig.particleType;
    final effectiveIndicatorType =
        widget.indicatorType ?? presetConfig.indicatorType;
    final effectiveLogoAnim =
        widget.logoAnimationType ?? presetConfig.logoAnimation;
    final effectiveTextAnim =
        widget.textAnimationType ?? presetConfig.textAnimation;
    final effectiveCircleHeight = widget.circleHeight > 0
        ? widget.circleHeight
        : presetConfig.circleHeight;

    final bool isLight = widget.preset == SplashPreset.light ||
        widget.preset == SplashPreset.minimal ||
        effectiveColors.first.computeLuminance() > 0.6;

    final Color defaultTextColor = isLight ? const Color(0xFF1C1C1E) : Colors.white;
    final Color defaultSubtextColor = isLight ? Colors.black54 : Colors.white.withValues(alpha: 0.7);
    final Color defaultIndicatorColor = isLight ? const Color(0xFF6C5CE7) : Colors.white;

    final logoWidget = widget.child ?? widget.brandingKit?.logo;

    Widget content = Scaffold(
      body: Stack(
        children: [
          AnimatedBackground(
            style: effectiveBackgroundStyle,
            backgroundColor: widget.backgroundColor ?? effectiveColors.first,
            gradient: widget.gradient,
            colors: effectiveColors,
            child: const SizedBox.expand(),
          ),
          if (effectiveParticleType != null)
            Positioned.fill(
              child: ParticleCanvas(
                type: effectiveParticleType,
                colors: widget.particleColors,
              ),
            ),
          if (widget.videoBuilder != null) widget.videoBuilder!(context),
          if (widget.lottieBuilder != null) widget.lottieBuilder!(context),
          if (widget.riveBuilder != null) widget.riveBuilder!(context),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (logoWidget != null)
                  AnimatedLogoWidget(
                    animationType: effectiveLogoAnim,
                    child: (effectiveCircleHeight > 0)
                        ? Container(
                            height: effectiveCircleHeight,
                            width: effectiveCircleHeight,
                            decoration: BoxDecoration(
                              color: widget.iconBackgroundColor ??
                                  presetConfig.iconBackgroundColor ??
                                  (isLight ? Colors.black.withValues(alpha: 0.08) : Colors.white24),
                              shape: BoxShape.circle,
                            ),
                            child: logoWidget,
                          )
                        : logoWidget,
                  ),
                const SizedBox(height: 24),
                if (widget.text != null) widget.text!,
                if (widget.text == null &&
                    (widget.titleText != null ||
                        widget.brandingKit?.appName != null))
                  AnimatedTextWidget(
                    text: widget.titleText ?? widget.brandingKit?.appName ?? '',
                    style: widget.textStyle ??
                        TextStyle(
                          color: defaultTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                    animationType: effectiveTextAnim,
                  ),
                if (widget.brandingKit?.tagline != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    widget.brandingKit!.tagline!,
                    style: TextStyle(
                      color: defaultSubtextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
                const SizedBox(height: 32),
                SplashLoadingIndicator(
                  type: effectiveIndicatorType,
                  color: defaultIndicatorColor,
                ),
              ],
            ),
          ),
          if (widget.brandingKit?.version != null ||
              widget.brandingKit?.copyright != null)
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  if (widget.brandingKit?.version != null)
                    Text(
                      'v${widget.brandingKit!.version}',
                      style: TextStyle(
                        color: defaultSubtextColor,
                        fontSize: 12,
                      ),
                    ),
                  if (widget.brandingKit?.copyright != null)
                    Text(
                      widget.brandingKit!.copyright!,
                      style: TextStyle(
                        color: defaultSubtextColor,
                        fontSize: 11,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );

    if (widget.preset == SplashPreset.liquidGlass ||
        widget.preset == SplashPreset.glass ||
        widget.template == SplashTemplate.liquidGlass ||
        widget.template == SplashTemplate.glass) {
      return LiquidGlassContainer(
        child: content,
      );
    }

    return content;
  }
}
