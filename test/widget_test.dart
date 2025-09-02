// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:plant_scan/main.dart';

void main() {
  testWidgets('Plant Scan app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PlantScanApp());

    // Verify that the app loads with Plant Scan title
    expect(find.text('Plant Scan'), findsOneWidget);

    // Verify that we have the main action buttons
    expect(find.text('Tomar Foto'), findsOneWidget);
    expect(find.text('Seleccionar desde Galería'), findsOneWidget);
  });
}
