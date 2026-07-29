import 'dart:ui';
import 'package:flutter/material.dart';

class LiquidGlassContainer extends StatelessWidget {
  final Widget? child;
  final double blur;
  final double opacity;
  final Color glowColor;
  final double borderRadius;
  final Border? border;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Gradient? gradient;

  const LiquidGlassContainer({
    super.key,
    this.child,
    this.blur = 20.0,
    this.opacity = 0.15,
    this.glowColor = Colors.white,
    this.borderRadius = 24.0,
    this.border,
    this.padding,
    this.margin,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              gradient: gradient ??
                  LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      glowColor.withValues(alpha: opacity * 1.5),
                      glowColor.withValues(alpha: opacity * 0.5),
                    ],
                  ),
              borderRadius: BorderRadius.circular(borderRadius),
              border: border ??
                  Border.all(
                    color: glowColor.withValues(alpha: 0.25),
                    width: 1.5,
                  ),
              boxShadow: [
                BoxShadow(
                  color: glowColor.withValues(alpha: 0.1),
                  blurRadius: blur * 1.5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
