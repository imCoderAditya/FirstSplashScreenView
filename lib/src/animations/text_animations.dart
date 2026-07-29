import 'dart:async';
import 'package:flutter/material.dart';

enum TextAnimationType {
  none,
  fade,
  scale,
  slide,
  typewriter,
  shimmer,
  glow,
}

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAnimationType animationType;
  final Duration duration;

  const AnimatedTextWidget({
    super.key,
    required this.text,
    this.style,
    this.animationType = TextAnimationType.fade,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String _displayedText = '';
  Timer? _typewriterTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    if (widget.animationType == TextAnimationType.typewriter) {
      _startTypewriter();
    } else {
      _controller.forward();
    }
  }

  void _startTypewriter() {
    int index = 0;
    final totalChars = widget.text.length;
    if (totalChars == 0) return;

    final charDuration = widget.duration.inMilliseconds ~/ totalChars;
    _typewriterTimer = Timer.periodic(
      Duration(milliseconds: max(charDuration, 30)),
      (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        if (index < totalChars) {
          setState(() {
            _displayedText += widget.text[index];
            index++;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    _typewriterTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.style ??
        Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            );

    if (widget.animationType == TextAnimationType.typewriter) {
      return Text(
        _displayedText,
        style: textStyle,
      );
    }

    switch (widget.animationType) {
      case TextAnimationType.none:
        return Text(widget.text, style: textStyle);

      case TextAnimationType.scale:
        return ScaleTransition(
          scale: _animation,
          child: Text(widget.text, style: textStyle),
        );

      case TextAnimationType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.5),
            end: Offset.zero,
          ).animate(_animation),
          child: FadeTransition(
            opacity: _animation,
            child: Text(widget.text, style: textStyle),
          ),
        );

      case TextAnimationType.fade:
      default:
        return FadeTransition(
          opacity: _animation,
          child: Text(widget.text, style: textStyle),
        );
    }
  }
}

int max(int a, int b) => a > b ? a : b;
