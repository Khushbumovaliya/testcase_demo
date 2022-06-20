import 'package:flutter/material.dart';
import 'package:flutter_mock_test_demo/screens/ThirdScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('enter text,tap,drag testing', () {
    testWidgets('add data in textfield', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ThirdScreen()));
      //add text in textfield
      await tester.enterText(find.byType(TextField),'hello');

      //tap on button to add data
      await tester.tap(find.byType(FloatingActionButton));

      //rebuild the widget for state change
      await tester.pump();
      
      expect(find.text('hello'),findsOneWidget);

      //swipe to remove item
      await tester.drag(find.byType(Dismissible,),Offset(400,0));

      //rebuild after dismissible animation end
      await tester.pumpAndSettle();

      //check the added item not visible after remove
      expect(find.text('hello'),findsNothing);
    });
  });
}
