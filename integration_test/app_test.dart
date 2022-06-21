import 'package:flutter/material.dart';
import 'package:flutter_mock_test_demo/screens/FifthScreen.dart';
import 'package:flutter_mock_test_demo/screens/FourthScreen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('integration test',(){

    testWidgets("Not inputting a text and wanting to go to the display page shows"
        "an error and prevents from going to the display page.",
        (WidgetTester tester) async{
          await tester.pumpWidget(MaterialApp(home: FourthScreen()));
          await tester.tap(find.byType(FloatingActionButton));
          await tester.pumpAndSettle();
          expect(find.byType(FourthScreen), findsOneWidget);
          expect(find.byType(FifthScreen), findsNothing);
         //expect(find.text('Input at least one character'),findsOneWidget);
        });

    testWidgets("After inputting a text, go to the display page which contains that same text "
    "and then navigate back to the typing page where the input should be clear",(WidgetTester tester)async{
      await tester.pumpWidget(MaterialApp(home: FourthScreen()));

      //add text in textfield
      final inputText = 'Hello there, this is an input.';
      await tester.enterText(find.byKey(Key('textField')),inputText);

      //tap on fab button
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      //display input text in next screen
      expect(find.byType(FourthScreen), findsNothing);
      expect(find.byType(FifthScreen), findsOneWidget);
      expect(find.text(inputText), findsOneWidget);

      //click on back button and go in previous screen
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      //on previous screen and the textfield is clear
      expect(find.byType(FourthScreen),findsOneWidget);
      expect(find.byType(FifthScreen),findsNothing);
      expect(find.text(inputText), findsNothing);

    });
  });

}