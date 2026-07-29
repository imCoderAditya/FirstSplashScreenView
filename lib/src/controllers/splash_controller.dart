import 'dart:async';
import 'package:flutter/material.dart';
import '../models/startup_checks.dart';

class SplashController {
  final Duration duration;
  final Widget? nextPage;
  final StartupChecks? startupChecks;
  final VoidCallback? onStarted;
  final VoidCallback? onCompleted;
  final void Function(double progress, String? status)? onProgressUpdate;

  Timer? _timer;
  bool _isDisposed = false;

  SplashController({
    required this.duration,
    this.nextPage,
    this.startupChecks,
    this.onStarted,
    this.onCompleted,
    this.onProgressUpdate,
  });

  void start(BuildContext context) async {
    onStarted?.call();

    final stopwatch = Stopwatch()..start();

    if (startupChecks != null) {
      try {
        if (startupChecks!.initializeTask != null) {
          await startupChecks!.initializeTask!().timeout(startupChecks!.timeout);
        }
        if (startupChecks!.asyncTasks != null && startupChecks!.asyncTasks!.isNotEmpty) {
          await Future.wait(startupChecks!.asyncTasks!).timeout(startupChecks!.timeout);
        }
      } catch (e) {
        debugPrint('SplashController initialization notice: $e');
      }
    }

    final elapsed = stopwatch.elapsed;
    final minDuration = startupChecks?.minDuration ?? duration;
    final remainingMs = minDuration.inMilliseconds - elapsed.inMilliseconds;

    final delay = remainingMs > 0 ? Duration(milliseconds: remainingMs) : Duration.zero;

    _timer = Timer(delay, () {
      if (!_isDisposed && context.mounted) {
        onCompleted?.call();
        if (nextPage != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => nextPage!),
          );
        }
      }
    });
  }

  void dispose() {
    _isDisposed = true;
    _timer?.cancel();
  }
}
