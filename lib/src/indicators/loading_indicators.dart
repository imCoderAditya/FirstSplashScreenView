import 'dart:math';
import 'package:flutter/material.dart';

enum LoadingIndicatorType {
  none,
  circular,
  linear,
  atom,
  orbit,
  ring,
  pulse,
  wave,
  dots,
  progressText,
}

class SplashLoadingIndicator extends StatefulWidget {
  final LoadingIndicatorType type;
  final Color color;
  final double size;
  final double? progress;
  final String? statusText;

  const SplashLoadingIndicator({
    super.key,
    this.type = LoadingIndicatorType.circular,
    this.color = Colors.white,
    this.size = 36.0,
    this.progress,
    this.statusText,
  });

  @override
  State<SplashLoadingIndicator> createState() => _SplashLoadingIndicatorState();
}

class _SplashLoadingIndicatorState extends State<SplashLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == LoadingIndicatorType.none) {
      return const SizedBox.shrink();
    }

    if (widget.type == LoadingIndicatorType.linear) {
      return SizedBox(
        width: 180,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: widget.progress,
                color: widget.color,
                backgroundColor: widget.color.withValues(alpha: 0.2),
                minHeight: 4,
              ),
            ),
            if (widget.statusText != null) ...[
              const SizedBox(height: 8),
              Text(
                widget.statusText!,
                style: TextStyle(
                  color: widget.color.withValues(alpha: 0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      );
    }

    if (widget.type == LoadingIndicatorType.atom ||
        widget.type == LoadingIndicatorType.orbit) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _AtomPainter(_controller.value, widget.color),
          );
        },
      );
    }

    if (widget.type == LoadingIndicatorType.dots) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (index) {
              final delay = index * 0.2;
              final scale = sin((_controller.value + delay) * 2 * pi) * 0.4 + 0.8;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Transform.scale(
                  scale: max(0.4, scale),
                  child: Container(
                    width: widget.size / 4,
                    height: widget.size / 4,
                    decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      );
    }

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CircularProgressIndicator(
        value: widget.progress,
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(widget.color),
      ),
    );
  }

  double max(double a, double b) => a > b ? a : b;
}

class _AtomPainter extends CustomPainter {
  final double progress;
  final Color color;

  _AtomPainter(this.progress, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    for (int i = 0; i < 3; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate((i * pi / 3) + (progress * 2 * pi));
      canvas.scale(1.0, 0.4);
      canvas.drawCircle(Offset.zero, radius, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _AtomPainter oldDelegate) => true;
}
