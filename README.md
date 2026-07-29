# FirstSplashScreenView 🚀

The **#1 modern, flagship Splash Screen package for Flutter**.

`FirstSplashScreenView` provides premium, production-ready, liquid-glass, animated, and particle-powered splash screens with one line of code, while maintaining **100% backward compatibility** for existing projects.

[![pub package](https://img.shields.io/pub/v/firstsplashscreenview.svg)](https://pub.dev/packages/firstsplashscreenview)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20macOS%20%7C%20Windows%20%7C%20Linux-blue)](https://flutter.dev)

---

## 📱 Screenshots & Presets Gallery

<div align="center">
  <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/ios_100_templates.png" alt="100+ Templates Explorer" width="230" />
  &nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/ios_rain.png" alt="Rain & Monsoon Particle Splash" width="230" />
  &nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/ios_gold.png" alt="Gold Engine" width="230" />
</div>

<br/>

<div align="center">
  <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/ios_cyberpunk.png" alt="Cyberpunk & Neon" width="230" />
  &nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/ios_material3.png" alt="Material 3 / You" width="230" />
  &nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/ios_gaming.png" alt="Gaming Engine" width="230" />
</div>

<br/>

<div align="center">
  <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/ios_luxury.png" alt="Luxury Gold" width="230" />
  &nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/ios_apple.png" alt="Apple Minimal" width="230" />
  &nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/ios_minimal.png" alt="Minimal Clean" width="230" />
</div>

---

## 🌟 Features Overview

- **⚡ One-Line Setup**: Instant splash screens using `SplashPreset.apple`, `SplashPreset.liquidGlass`, `SplashPreset.cyberpunk`, `SplashPreset.material3`, etc.
- **💎 100+ Premium Templates**: Pre-configured domain templates for Tech, Finance, Crypto, AI, Healthcare, Gaming, Luxury, E-Commerce, Food, Travel, etc.
- **🧊 Liquid Glass (iOS 26 Style)**: Frosted glassmorphism, dynamic ambient reflections, and glow borders.
- **✨ GPU Particle Engine**: Full-viewport particle canvas (Fireflies, Stars, Rain, Snow, Sparkles, Bubbles, Leaves) with custom `particleColors`.
- **☀️ Intelligent Light Theme**: Automatic high-contrast dark text (`#1C1C1E`), dark metadata, and indigo indicators for `SplashPreset.light` & `SplashPreset.minimal`.
- **🔄 Advanced Animations**: Logo animations (Scale, Fade, Bounce, Flip, 3D Rotation, Pulse, Floating, Slide) & Text animations (Typewriter, Slide, Fade, Scale).
- **⏳ Async Startup Checks**: Seamlessly execute Firebase, Hive, SharedPreferences, or API tasks during splash screen.
- **🏷️ App Branding Kit**: Display App Name, Tagline, Logo, Version, Build Number, and Copyright metadata automatically.
- **🎨 Pluggable Media Builders**: Builders for custom Lottie, Rive, Video, or Custom widgets without forcing heavy core dependencies.
- **🛡️ 100% Backward Compatible**: Legacy `SplashScreen()` and `SplashScreen.gradient()` constructors remain fully supported.
- **🌐 6 Platform Support**: Android, iOS, Web, macOS, Windows, and Linux.

---

## 📦 Installation

Add `firstsplashscreenview` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firstsplashscreenview: ^1.0.2
```

---

## 🚀 Usage Guide

### 1. One-Line Preset Usage (Recommended)

```dart
import 'package:firstsplashscreenview/firstsplashscreenview.dart';
import 'package:flutter/material.dart';

FirstSplashScreenView(
  preset: SplashPreset.liquidGlass,
  duration: const Duration(seconds: 3),
  nextPage: const HomePage(),
  titleText: 'My App',
  child: const Icon(Icons.flash_on, size: 50, color: Colors.white),
);
```

### 2. 100+ Templates Usage

```dart
FirstSplashScreenView(
  template: SplashTemplate.cyberpunk, // Select from 100+ templates
  duration: const Duration(seconds: 3),
  nextPage: const HomePage(),
  titleText: 'Cyberpunk App',
  child: const Icon(Icons.memory, size: 50, color: Colors.pinkAccent),
);
```

### 3. Liquid Glass (iOS 26 Style)

```dart
FirstSplashScreenView(
  preset: SplashPreset.liquidGlass,
  duration: const Duration(seconds: 4),
  nextPage: const HomePage(),
  titleText: 'Liquid Glass Demo',
  child: const Icon(Icons.water_drop, size: 50, color: Colors.white),
);
```

### 4. GPU Particle Engine (Rain, Fireflies, Stars, Snow)

```dart
FirstSplashScreenView(
  preset: SplashPreset.dark,
  particleType: ParticleType.rain,
  particleColors: const [Colors.lightBlueAccent, Colors.cyanAccent], // Custom particle colors
  duration: const Duration(seconds: 3),
  nextPage: const HomePage(),
  titleText: 'Rain & Monsoon Splash',
  child: const Icon(Icons.umbrella_rounded, size: 50, color: Colors.lightBlueAccent),
);
```

### 5. Intelligent Light Theme Usage

```dart
FirstSplashScreenView(
  preset: SplashPreset.light, // Automatic dark text & indigo indicator contrast
  particleType: ParticleType.stars,
  duration: const Duration(seconds: 3),
  nextPage: const HomePage(),
  titleText: 'Light Theme Splash',
  child: const Icon(Icons.wb_sunny_rounded, size: 50, color: Color(0xFF6C5CE7)),
);
```

### 6. Async Startup Initialization & Branding Kit

```dart
FirstSplashScreenView(
  preset: SplashPreset.apple,
  duration: const Duration(seconds: 4),
  nextPage: const HomePage(),
  brandingKit: const BrandingKit(
    appName: 'Acme Enterprise',
    tagline: 'Empowering Modern Workflows',
    version: '1.0.2',
    copyright: '© 2026 Acme Corp',
  ),
  startupChecks: StartupChecks(
    initializeTask: () async {
      // Async initialization (Firebase, Hive, SecureStorage, APIs)
      await Future.delayed(const Duration(seconds: 2));
    },
    timeout: const Duration(seconds: 10),
  ),
  child: const Icon(Icons.business, size: 50, color: Colors.white),
);
```

### 7. Legacy Backward-Compatible Usage

Existing code using `SplashScreen` or `SplashScreen.gradient` works out of the box:

```dart
SplashScreen(
  backgroundColor: Colors.purple,
  duration: const Duration(seconds: 3),
  nextPage: const WelcomePage(),
  circleHeight: 60,
  iconBackgroundColor: Colors.white,
  child: const Icon(Icons.ac_unit_outlined, size: 50),
  text: const Text('Legacy Splash Screen'),
);
```

---

## 🎨 100+ Templates Reference List

### Tech & Corporate
`apple`, `material3`, `materialYou`, `glass`, `liquidGlass`, `corporate`, `ai`, `space`, `startup`, `saas`, `cloud`, `developer`, `quantum`, `security`

### Industry & Business
`finance`, `crypto`, `realEstate`, `education`, `healthcare`, `medical`, `eCommerce`, `fashion`, `automotive`, `logistics`

### Lifestyle & Media
`social`, `food`, `travel`, `gaming`, `arcade`, `music`, `podcast`, `news`, `photography`, `fitness`, `event`

### Aesthetics & Art
`luxury`, `gold`, `diamond`, `platinum`, `neon`, `gradient`, `cyberpunk`, `minimal`, `elegant`, `dark`, `light`, `vintage`, `retro`, `hologram`, `aurora`, `sunrise`, `midnight`, `sunset`, `cosmic`, `ocean`, `forest`, `nature`, `fire`, `volcano`, `metallic`

### Motion & Dynamics
`animated`, `wave`, `blob`, `ripple`, `particle`, `glow`, `shimmer`, `typewriter`, `flip`, `rotation3d`, `bounce`, `morph`, `zoom`, `hero`, `liquid`, `mesh`, `shader`

### Media & Interactive
`video`, `lottie`, `rive`, `interactive`, `countdown`, `multiSequence`, `adaptive`

### Effects & Particles
`fireflies`, `snow`, `rain`, `sparkles`, `bubbles`, `stars`, `leaves`, `magic`, `atom`, `orbit`, `infinity`, `dna`, `dots`, `bars`, `pulseWave`, `shimmerText`, `rollingText`, `glowText`, `glassmorphicOverlay`, `dynamicMonet`, `gradientWave`, `futuristicHUD`

---

## ⚙️ Parameter Reference

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `preset` | `SplashPreset?` | `SplashPreset.modern` | Primary built-in preset theme |
| `template` | `SplashTemplate?` | `null` | Pre-configured template from 100+ templates |
| `duration` | `Duration` | `Duration(seconds: 3)` | Splash display duration |
| `nextPage` | `Widget?` | `null` | Target widget to navigate after completion |
| `child` | `Widget?` | `null` | Center logo/icon widget |
| `text` | `Text?` | `null` | Custom title text widget |
| `titleText` | `String?` | `null` | Title text string |
| `textStyle` | `TextStyle?` | `null` | TextStyle for titleText |
| `gradient` | `Gradient?` | `null` | Background gradient |
| `backgroundColor` | `Color?` | `null` | Solid background color |
| `colors` | `List<Color>?` | `null` | Dynamic color palette |
| `circleHeight` | `double` | `90.0` | Size of logo background circle |
| `iconBackgroundColor` | `Color?` | `null` | Background color for logo circle |
| `brandingKit` | `BrandingKit?` | `null` | App metadata (AppName, Tagline, Version, Copyright) |
| `startupChecks` | `StartupChecks?` | `null` | Async initialization tasks configuration |
| `particleType` | `ParticleType?` | `null` | GPU particle effect |
| `particleColors` | `List<Color>?` | `null` | Custom particle color palette |
| `indicatorType` | `LoadingIndicatorType?` | `LoadingIndicatorType.circular` | Loading indicator style |
| `logoAnimationType` | `LogoAnimationType?` | `LogoAnimationType.scale` | Logo animation effect |
| `textAnimationType` | `TextAnimationType?` | `TextAnimationType.fade` | Text animation effect |

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for details.
