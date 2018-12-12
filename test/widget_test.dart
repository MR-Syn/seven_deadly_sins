// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:seven_deadly_sins/main.dart';
import 'package:seven_deadly_sins/constants.dart';

void main() {
  testWidgets('Seven Deadly Sins main test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new HomePage());

    // Verify that title and subtitles are visible
    expect(find.text(appTitle), findsWidgets);
    expect(find.text(appSubtitle), findsWidgets);

    // Tap the camera icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text("Superbia"), findsWidgets);
    expect(find.text("Avarizia"), findsNothing);
  });
}
