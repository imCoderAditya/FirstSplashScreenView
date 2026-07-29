import 'package:firstsplashscreenview/firstsplashscreenview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SplashScreen legacy constructor renders correctly and navigates',
      (WidgetTester tester) async {
    bool navigated = false;

    final testApp = MaterialApp(
      home: SplashScreen(
        duration: const Duration(milliseconds: 100),
        nextPage: Builder(
          builder: (context) {
            navigated = true;
            return const Scaffold(body: Text('Next Page'));
          },
        ),
        text: const Text('Test Legacy Splash'),
        child: const Icon(Icons.star),
      ),
    );

    await tester.pumpWidget(testApp);

    expect(find.text('Test Legacy Splash'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);

    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(navigated, isTrue);
  });

  testWidgets('SplashScreen.gradient constructor renders correctly',
      (WidgetTester tester) async {
    final testApp = MaterialApp(
      home: SplashScreen.gradient(
        gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
        duration: const Duration(milliseconds: 100),
        nextPage: const Scaffold(body: Text('Next Page')),
        text: const Text('Gradient Splash'),
      ),
    );

    await tester.pumpWidget(testApp);
    expect(find.text('Gradient Splash'), findsOneWidget);
  });

  testWidgets('FirstSplashScreenView with Apple preset renders correctly',
      (WidgetTester tester) async {
    const testApp = MaterialApp(
      home: FirstSplashScreenView(
        preset: SplashPreset.apple,
        duration: Duration(milliseconds: 100),
        nextPage: Scaffold(body: Text('Home')),
        titleText: 'Apple Style Splash',
        child: Icon(Icons.apple),
      ),
    );

    await tester.pumpWidget(testApp);
    expect(find.text('Apple Style Splash'), findsOneWidget);
    expect(find.byIcon(Icons.apple), findsOneWidget);
  });
}
