import 'package:flutter/material.dart';
import 'package:flutter_mock_test_demo/screens/Home.dart';
import 'package:flutter_mock_test_demo/screens/SecondScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('widget testing', () {
    testWidgets('MyWidget has a title and message',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Home(title: 'T', message: 'M'),
      ));
      final titleFinder = find.text('T');
      final messageFinder = find.text('M');

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);

      expect(find.byKey(Key('K')), findsOneWidget);

      // expect(find.byWidget(childWidget), findsOneWidget);
    });

    testWidgets('scrollable widget test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SecondScreen()));
      final listFinder = find.byType(Scrollable);
      final itemFinder = find.byKey(const ValueKey('item_50_text'));
      await tester.scrollUntilVisible(
        itemFinder,
        50.0,
        scrollable: listFinder,
      );
      // await tester.scrollUntilVisible(listFinder,175);
      expect(itemFinder, findsOneWidget);
    });
  });
}
