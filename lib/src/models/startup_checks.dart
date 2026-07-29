import 'dart:async';

/// Callback signatures for startup checks and initialization.
typedef AsyncInitializationCallback = Future<void> Function();
typedef InitializationProgressCallback = void Function(double progress, String? status);

/// Configuration for async app initialization during splash screen display.
class StartupChecks {
  /// Asynchronous task to execute during splash screen (e.g. Firebase, Storage, APIs).
  final AsyncInitializationCallback? initializeTask;

  /// Optional list of concurrent futures to resolve before completing splash screen.
  final List<Future<dynamic>>? asyncTasks;

  /// Timeout duration for initialization.
  final Duration timeout;

  /// Maximum retry count if initialization fails.
  final int retryCount;

  /// Minimum display duration for splash screen even if initialization completes fast.
  final Duration minDuration;

  /// Maximum display duration cap for splash screen.
  final Duration? maxDuration;

  const StartupChecks({
    this.initializeTask,
    this.asyncTasks,
    this.timeout = const Duration(seconds: 15),
    this.retryCount = 1,
    this.minDuration = const Duration(seconds: 2),
    this.maxDuration,
  });
}
