import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:crypto_app/features/crypto_search/presentation/widgets/proceed_with_search_button.dart';

void main() {
  Widget widgetSetupToBeTested({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('When pressing the button a function should be called',
      (tester) async {
    //ARRANGE
    var testingString = 'testingString';
    var stringModified = 'stringModified';

    //!function to be passed as a paremeter
    void setSelected() {
      testingString = stringModified;
    }

    //ACT
    await tester.pumpWidget(widgetSetupToBeTested(
        child: ProceedWithSearchButton(getNfts: setSelected)));
    await tester.pump();
    //ASSERT
    //!Testing strings are equal
    expect(testingString, isNot(equals(stringModified)));
    final button = find.byKey(const Key('preceed_button_button'));
    await tester.pump(const Duration(seconds: 1));

    await tester.tap(button);

    expect(testingString, equals(stringModified));
  });
}
