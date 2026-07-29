import 'dart:math';
import 'package:flutter/material.dart';

enum BackgroundStyle {
  solid,
  gradient,
  animatedGradient,
  mesh,
  aurora,
  glass,
  liquidGlass,
  waves,
  cyberpunk,
  space,
  dark,
  light,
}

class AnimatedBackground extends StatefulWidget {
  final BackgroundStyle style;
  final Color? backgroundColor;
  final Gradient? gradient;
  final List<Color>? colors;
  final Widget? child;

  const AnimatedBackground({
    super.key,
    this.style = BackgroundStyle.gradient,
    this.backgroundColor,
    this.gradient,
    this.colors,
    this.child,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.style == BackgroundStyle.solid) {
      return Container(
        color: widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: widget.child,
      );
    }

    if (widget.style == BackgroundStyle.waves) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _WavePainter(_controller.value, widget.colors),
            child: widget.child,
          );
        },
      );
    }

    if (widget.style == BackgroundStyle.animatedGradient ||
        widget.style == BackgroundStyle.aurora) {
      final defaultColors = widget.colors ??
          [
            const Color(0xFF6C5CE7),
            const Color(0xFFA29BFE),
            const Color(0xFF00CEC9),
            const Color(0xFF0984E3),
          ];

      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(_controller.value * 2 - 1, -1),
                end: Alignment(1 - _controller.value * 2, 1),
                colors: defaultColors,
              ),
            ),
            child: widget.child,
          );
        },
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        gradient: widget.gradient ??
            LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: widget.colors ??
                  [
                    const Color(0xFF1E1E2C),
                    const Color(0xFF2D2B42),
                  ],
            ),
      ),
      child: widget.child,
    );
  }
}

class _WavePainter extends CustomPainter {
  final double animationValue;
  final List<Color>? colors;

  _WavePainter(this.animationValue, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final waveColor1 =
        colors?.first ?? const Color(0xFF6C5CE7).withValues(alpha: 0.4);
    final waveColor2 = colors?.length != null && colors!.length > 1
        ? colors![1].withValues(alpha: 0.3)
        : const Color(0xFF00CEC9).withValues(alpha: 0.3);

    final paint1 = Paint()..color = waveColor1..style = PaintingStyle.fill;
    final paint2 = Paint()..color = waveColor2..style = PaintingStyle.fill;

    final path1 = Path();
    final path2 = Path();

    path1.moveTo(0, size.height * 0.7);
    path2.moveTo(0, size.height * 0.75);

    for (double i = 0; i <= size.width; i++) {
      path1.lineTo(
        i,
        size.height * 0.7 +
            sin((i / size.width * 2 * pi) + (animationValue * 2 * pi)) * 25,
      );
      path2.lineTo(
        i,
        size.height * 0.75 +
            cos((i / size.width * 2 * pi) + (animationValue * 2 * pi)) * 30,
      );
    }

    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();

    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();

    canvas.drawPath(path2, paint2);
    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) => true;
}
