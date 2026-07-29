import 'dart:math';
import 'package:flutter/material.dart';

enum ParticleType {
  fireflies,
  stars,
  rain,
  snow,
  sparkles,
  bubbles,
  confetti,
  magic,
  leaves,
  floatingIcons,
}

class Particle {
  double x;
  double y;
  double size;
  double speedY;
  double speedX;
  double opacity;
  Color color;
  double rotation;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speedY,
    required this.speedX,
    required this.opacity,
    required this.color,
    this.rotation = 0.0,
  });
}

class ParticleCanvas extends StatefulWidget {
  final ParticleType type;
  final int count;
  final List<Color>? colors;
  final Widget? child;

  const ParticleCanvas({
    super.key,
    this.type = ParticleType.stars,
    this.count = 50,
    this.colors,
    this.child,
  });

  @override
  State<ParticleCanvas> createState() => _ParticleCanvasState();
}

class _ParticleCanvasState extends State<ParticleCanvas>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _controller.addListener(_updateParticles);
    _initParticles();
  }

  @override
  void didUpdateWidget(covariant ParticleCanvas oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type || oldWidget.colors != widget.colors) {
      _initParticles();
    }
  }

  void _initParticles() {
    _particles.clear();
    final defaultColors = widget.colors ??
        const [
          Colors.white,
          Colors.amberAccent,
          Colors.cyanAccent,
          Colors.purpleAccent,
        ];

    for (int i = 0; i < widget.count; i++) {
      double speedY = 0.001 + _random.nextDouble() * 0.003;
      double speedX = (_random.nextDouble() - 0.5) * 0.001;
      double size = _random.nextDouble() * 4 + 2;

      if (widget.type == ParticleType.rain) {
        speedY = 0.015 + _random.nextDouble() * 0.02; // Faster downward rain
        speedX = -0.002; // Slight wind angle
        size = _random.nextDouble() * 3 + 2;
      } else if (widget.type == ParticleType.snow) {
        speedY = 0.002 + _random.nextDouble() * 0.003;
        speedX = (_random.nextDouble() - 0.5) * 0.002;
        size = _random.nextDouble() * 5 + 3;
      } else if (widget.type == ParticleType.fireflies) {
        speedY = 0.001 + _random.nextDouble() * 0.002;
        size = _random.nextDouble() * 6 + 3;
      }

      _particles.add(
        Particle(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          size: size,
          speedY: speedY,
          speedX: speedX,
          opacity: _random.nextDouble() * 0.6 + 0.4,
          color: defaultColors[_random.nextInt(defaultColors.length)],
          rotation: _random.nextDouble() * 2 * pi,
        ),
      );
    }
  }

  void _updateParticles() {
    if (!mounted) return;
    setState(() {
      for (var particle in _particles) {
        if (widget.type == ParticleType.rain ||
            widget.type == ParticleType.snow) {
          particle.y += particle.speedY;
          particle.x += particle.speedX;
          if (particle.y > 1.05) {
            particle.y = -0.05;
            particle.x = _random.nextDouble();
          }
        } else if (widget.type == ParticleType.fireflies) {
          particle.y -= particle.speedY;
          particle.x += sin(_controller.value * 2 * pi + particle.y * 10) * 0.002;
          if (particle.y < -0.05) {
            particle.y = 1.05;
            particle.x = _random.nextDouble();
          }
        } else {
          particle.y -= particle.speedY;
          particle.x += particle.speedX;
          if (particle.y < -0.05) {
            particle.y = 1.05;
            particle.x = _random.nextDouble();
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: RepaintBoundary(
        child: CustomPaint(
          painter: _ParticlePainter(_particles, widget.type, _controller.value),
          child: widget.child,
        ),
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final ParticleType type;
  final double animValue;

  _ParticlePainter(this.particles, this.type, this.animValue);

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width == 0 || size.height == 0) return;

    final paint = Paint()..style = PaintingStyle.fill;

    for (var particle in particles) {
      final dx = particle.x * size.width;
      final dy = particle.y * size.height;

      if (type == ParticleType.rain) {
        paint
          ..color = particle.color.withValues(alpha: particle.opacity)
          ..strokeWidth = particle.size * 0.6
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

        canvas.drawLine(
          Offset(dx, dy),
          Offset(dx - 3, dy + particle.size * 8),
          paint,
        );
      } else if (type == ParticleType.fireflies) {
        final glowOpacity = (sin(animValue * 2 * pi + particle.x * 20) * 0.3 + 0.7) * particle.opacity;
        
        // Glow aura
        paint
          ..style = PaintingStyle.fill
          ..color = particle.color.withValues(alpha: glowOpacity * 0.3);
        canvas.drawCircle(Offset(dx, dy), particle.size * 2.5, paint);

        // Core dot
        paint.color = particle.color.withValues(alpha: glowOpacity);
        canvas.drawCircle(Offset(dx, dy), particle.size, paint);
      } else if (type == ParticleType.stars || type == ParticleType.sparkles) {
        final twinkle = (sin(animValue * 4 * pi + particle.y * 30) * 0.4 + 0.6) * particle.opacity;
        paint
          ..style = PaintingStyle.fill
          ..color = particle.color.withValues(alpha: twinkle);
        canvas.drawCircle(Offset(dx, dy), particle.size, paint);
      } else if (type == ParticleType.snow) {
        paint
          ..style = PaintingStyle.fill
          ..color = particle.color.withValues(alpha: particle.opacity * 0.8);
        canvas.drawCircle(Offset(dx, dy), particle.size, paint);
      } else {
        paint
          ..style = PaintingStyle.fill
          ..color = particle.color.withValues(alpha: particle.opacity);
        canvas.drawCircle(Offset(dx, dy), particle.size, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
