import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kamn/conter.dart';

void main() {
  testWidgets('incrementCounter should update counter',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CounterScreen()));

    // تأكد أن القيمة الأولية هي 0
    expect(find.text('Counter: 0'), findsOneWidget);

    // استدعاء الدالة عبر الضغط على زر (إذا كان موجودًا)
    await tester.tap(find.byType(
        ElevatedButton)); // Change ElevatedButton to the correct button type if needed
    await tester.pump();

    // تحقق من تحديث القيمة
    expect(find.text('Counter: 1'), findsOneWidget);
  });
}
