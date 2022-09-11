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
  SplashScreen(
      {super.key,
      this.duration,
      this.child,
      this.navigator,
      this.circleAvatar,
      this.colors,
      this.appBar,
      required this.nextPage,
      this.icon,
      this.timer,
      this.text})
```





## (Optional)  Implements
This activity in change 'android\app\src\main\res\values\styles.xml'
```xml
  <style name="LaunchTheme" parent="@android:style/Theme.Light.NoTitleBar">
        <!-- Show a splash screen on the activity. Automatically removed when
             the Flutter engine draws its first frame -->
        <item name="android:windowBackground">@drawable/launch_background</item>
        <item name="android:colorBackground">#ff1100</item>
        <item name="android:statusBarColor">#ff1100</item>

    </style>

```


```dart
SplashScreen(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "ImCoderAditya",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        colors: Colors.red,
        circleAvatar: const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.ac_unit_outlined,
            color: Colors.blue,
          ),
        ),
        nextPage: HomePage(),
        duration: Duration(seconds: 20),
      ),
```


   <div> 
    <img src="https://raw.githubusercontent.com/imCoderAditya/SplashScreenView/master/screenshot/1.jpg"alt="loading..." width="414" height="896">
    <img src="https://raw.githubusercontent.com/imCoderAditya/SplashScreenView/master/screenshot/2.jpg"alt="loading..." width="414" height="896"> 
    <img src="https://raw.githubusercontent.com/imCoderAditya/SplashScreenView/master/screenshot/3.jpg"alt="loading..." width="414" height="896">
    <img src="https://raw.githubusercontent.com/imCoderAditya/SplashScreenView/master/screenshot/4.jpg"alt="loading..." width="414" height="896">
    <img src="https://raw.githubusercontent.com/imCoderAditya/SplashScreenView/master/screenshot/5.jpg"alt="loading..." width="414" height="896">
   </div>
