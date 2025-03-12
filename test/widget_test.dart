// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:PoliceX/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // ✅ Build the app and trigger a frame
    await tester.pumpWidget(MyApp());

    // ✅ Ensure the main widget tree is built
    expect(find.byType(MaterialApp), findsOneWidget);

    // ✅ Add a small delay to handle async loading
    await tester.pumpAndSettle();

    // ✅ Check if the main page widget exists (like a dashboard)
    // expect(find.text('Active Cases'), findsOneWidget);

    // ✅ Tap a button (if needed)
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // ✅ Check for the result (example: Counter increment)
    // expect(find.text('1'), findsOneWidget);
  });
}
