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
    this.count = 40,
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
      _particles.add(
        Particle(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          size: _random.nextDouble() * 4 + 2,
          speedY: (_random.nextDouble() * 0.002 + 0.0005) *
              (widget.type == ParticleType.rain ? 5 : 1),
          speedX: (_random.nextDouble() - 0.5) * 0.001,
          opacity: _random.nextDouble() * 0.7 + 0.3,
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
          if (particle.y > 1.0) {
            particle.y = -0.05;
            particle.x = _random.nextDouble();
          }
        } else if (widget.type == ParticleType.bubbles ||
            widget.type == ParticleType.fireflies) {
          particle.y -= particle.speedY;
          particle.x += sin(_controller.value * 2 * pi + particle.y * 10) * 0.001;
          if (particle.y < -0.05) {
            particle.y = 1.05;
            particle.x = _random.nextDouble();
          }
        } else {
          particle.y -= particle.speedY;
          particle.x += particle.speedX;
          if (particle.y < -0.05) {
            particle.y = 1.05;
          }
          if (particle.x < 0 || particle.x > 1) {
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
    return RepaintBoundary(
      child: CustomPaint(
        painter: _ParticlePainter(_particles, widget.type),
        child: widget.child,
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final ParticleType type;

  _ParticlePainter(this.particles, this.type);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var particle in particles) {
      paint.color = particle.color.withValues(alpha: particle.opacity);
      final dx = particle.x * size.width;
      final dy = particle.y * size.height;

      if (type == ParticleType.stars || type == ParticleType.sparkles) {
        canvas.drawCircle(Offset(dx, dy), particle.size, paint);
      } else if (type == ParticleType.rain) {
        canvas.drawLine(
          Offset(dx, dy),
          Offset(dx + particle.speedX * 10, dy + particle.size * 3),
          paint..strokeWidth = 1.5,
        );
      } else if (type == ParticleType.bubbles) {
        canvas.drawCircle(
          Offset(dx, dy),
          particle.size * 1.5,
          paint
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.0,
        );
      } else {
        canvas.drawCircle(Offset(dx, dy), particle.size, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
