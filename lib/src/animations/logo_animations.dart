import 'dart:math';
import 'package:flutter/material.dart';

enum LogoAnimationType {
  none,
  fade,
  scale,
  zoom,
  rotation,
  flip,
  bounce,
  elastic,
  slide,
  pulse,
  glow,
  floating,
  shake,
  rotation3D,
}

class AnimatedLogoWidget extends StatefulWidget {
  final Widget child;
  final LogoAnimationType animationType;
  final Duration duration;
  final Curve curve;

  const AnimatedLogoWidget({
    super.key,
    required this.child,
    this.animationType = LogoAnimationType.scale,
    this.duration = const Duration(milliseconds: 1200),
    this.curve = Curves.easeOutBack,
  });

  @override
  State<AnimatedLogoWidget> createState() => _AnimatedLogoWidgetState();
}

class _AnimatedLogoWidgetState extends State<AnimatedLogoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    if (widget.animationType == LogoAnimationType.pulse ||
        widget.animationType == LogoAnimationType.floating) {
      _controller.repeat(reverse: true);
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.animationType) {
      case LogoAnimationType.none:
        return widget.child;

      case LogoAnimationType.fade:
        return FadeTransition(
          opacity: _animation,
          child: widget.child,
        );

      case LogoAnimationType.scale:
      case LogoAnimationType.zoom:
        return ScaleTransition(
          scale: _animation,
          child: widget.child,
        );

      case LogoAnimationType.bounce:
      case LogoAnimationType.elastic:
        return ScaleTransition(
          scale: _animation,
          child: widget.child,
        );

      case LogoAnimationType.rotation:
        return RotationTransition(
          turns: _animation,
          child: widget.child,
        );

      case LogoAnimationType.pulse:
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final scale = 1.0 + (_controller.value * 0.12);
            return Transform.scale(
              scale: scale,
              child: widget.child,
            );
          },
        );

      case LogoAnimationType.floating:
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final offsetY = sin(_controller.value * pi) * 12.0;
            return Transform.translate(
              offset: Offset(0, offsetY),
              child: widget.child,
            );
          },
        );

      case LogoAnimationType.rotation3D:
      case LogoAnimationType.flip:
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY((1 - _animation.value) * pi),
              child: widget.child,
            );
          },
        );

      case LogoAnimationType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.5),
            end: Offset.zero,
          ).animate(_animation),
          child: FadeTransition(
            opacity: _animation,
            child: widget.child,
          ),
        );

      case LogoAnimationType.glow:
      default:
        return FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: _animation,
            child: widget.child,
          ),
        );
    }
  }
}
