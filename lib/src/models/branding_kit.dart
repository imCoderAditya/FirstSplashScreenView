import 'package:flutter/material.dart';

/// Branding metadata container for the application splash screen.
class BrandingKit {
  /// Primary app name displayed on the splash screen.
  final String? appName;

  /// Secondary tagline or slogan.
  final String? tagline;

  /// App logo widget.
  final Widget? logo;

  /// Company or publisher name.
  final String? companyName;

  /// App version string (e.g. '1.0.0').
  final String? version;

  /// App build number (e.g. '42').
  final String? buildNumber;

  /// Copyright string (e.g. '© 2026 Acme Corp').
  final String? copyright;

  const BrandingKit({
    this.appName,
    this.tagline,
    this.logo,
    this.companyName,
    this.version,
    this.buildNumber,
    this.copyright,
  });
}
