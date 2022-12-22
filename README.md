<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This is a Splash Screen Package 

## Features
```dart
SplashScreen({
    super.key,
    this.duration = const Duration(seconds: 5),
    required this.nextPage,
    this.circleHeight = 0,
    this.iconBackgroundColor,
    this.backgroundColor,
    this.timer,
    this.child,
    this.text,
  });

```
## SplashScreen with Gradient
```dart
  SplashScreen.gradient({
    super.key,
    this.duration = const Duration(seconds: 5),
    this.gradient,
    required this.nextPage,
    this.circleHeight = 0,
    this.iconBackgroundColor,
    this.timer,
    this.child,
    this.text,
  });
```

# Using Code 
```dart
SplashScreen(
        backgroundColor: Colors.purple,
        duration: const Duration(minutes: 1),
        nextPage: const WelcomePage(),
        iconBackgroundColor: Colors.white,
        circleHeight: 60,
        child: Icon(
          Icons.ac_unit_outlined,
          size: 50,
        ),
        text: const Text(
          "ImCoderAditya",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
    ),
```

# Using Code 
```dart
 SplashScreen.gradient(
      gradient: const LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Colors.red,
            Colors.pink,
            Colors.purpleAccent,
          ],
        ),
        duration: const Duration(minutes: 1),
        nextPage: const WelcomePage(),
        iconBackgroundColor: Colors.white,
        circleHeight: 60,
        child: Icon(
          Icons.code,
          size: 50,
        ),
        text: const Text(
          "ImCoderAditya",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
```


## (Optional) Using Code .

```dart
SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
```
# ScreenShot
   <div> 
    <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/1.jpg"alt="loading..." width="414" height="896">
    <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/2.jpg"alt="loading..." width="414" height="896"> 
    <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/3.jpg"alt="loading..." width="414" height="896">
    <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/4.jpg"alt="loading..." width="414" height="896">
    <img src="https://raw.githubusercontent.com/imCoderAditya/FirstSplashScreenView/master/screenshot/5.jpg"alt="loading..." width="414" height="896">
   </div>
