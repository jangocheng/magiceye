import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magiceye/src/extra/circle_button.dart';
import '../example/lib/main.dart';

void main() {
  testWidgets(
    'Ensure simplest behavior is working properly',
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Initially, there must be not image
      expect(find.byType(AspectRatio), findsOneWidget);
      expect(find.byType(Image), findsNothing);

      final takePictureButton =
          find.widgetWithText(RaisedButton, "Take Picture");

      expect(takePictureButton, findsOneWidget);

      // Tap "Take Picture" button
      await tester.tap(
        find.widgetWithText(RaisedButton, "Take Picture"),
      );

      await tester.pump();
      await tester.pump(Duration(seconds: 10));
      await tester.pump(Duration(seconds: 10));

      await tester.tap(
        find.widgetWithIcon(IconButton, Icons.cached),
      );

      // await tester.tap(
      //   find.widgetWithIcon(CircleButton, Icons.check),
      // );

      // Initially, there must be not image
      //expect(find.byType(AspectRatio), findsNothing);
      //expect(find.byType(Image), findsOneWidget);
    },
  );
}
