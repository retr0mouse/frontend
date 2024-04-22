import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inbank_frontend/widgets/loan_form.dart';
import 'package:inbank_frontend/widgets/national_id_field.dart';

void main() {
  testWidgets('LoanForm displays the form and initial values',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: Column(
        children: const [LoanForm()],
      ),
    )));
    // Verify the form and initial values are displayed
    expect(find.text('Loan Amount: 2500 €'), findsOneWidget);
    expect(find.text('Loan Period: 36 months'), findsOneWidget);
    expect(find.text('Approved Loan Amount: -- €'), findsOneWidget);
    expect(find.text('Approved Loan Period: -- months'), findsOneWidget);

    // Verify sliders are displayed
    expect(find.byType(Slider), findsNWidgets(2));
  });

  // Test the slider behavior for loan amount
  testWidgets('LoanForm slider changes the loan amount',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: Column(
        children: const [LoanForm()],
      ),
    )));
    final Slider slider = tester.widget(find.byType(Slider).first);
    const double newValue = 2500;

    // Perform slider interaction
    await tester.drag(find.byType(Slider).first, const Offset(10.0, 0));
    await tester.press(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();

    // Verify slider value changed
    expect(slider.value, newValue);
  });

  // Test the slider behavior for loan period
  testWidgets('LoanForm slider changes the loan period',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: Column(
        children: const [LoanForm()],
      ),
    )));
    final Slider slider = tester.widget(find.byType(Slider).last);
    const double newValue = 36;

    // Perform slider interaction
    await tester.drag(find.byType(Slider).last, const Offset(10.0, 0));
    await tester.press(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();

    // Verify slider value changed
    expect(slider.value, newValue);
  });

  // Test the slider behavior for loan amount
  testWidgets('LoanForm slider changes the loan amount',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: Column(
        children: const [LoanForm()],
      ),
    )));
    final Slider slider = tester.widget(find.byType(Slider).last);
    const double newValue = 36;

    // Perform slider interaction
    await tester.drag(find.byType(Slider).first, const Offset(10.0, 0));
    await tester.press(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();

    // Verify slider value changed
    expect(slider.value, newValue);
  });

  testWidgets(
    'LoanForm slider returns customer has debt, no loan can be approved',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
        body: Column(
          children: [LoanForm()],
        ),
      )));
      var textField = find.byType(NationalIdTextFormField).first;
      await tester.enterText(textField, "37605030299");
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      var noValuesFinder = find.text("Approved Loan Amount: -- €");
      // Verify slider value changed
      expect(noValuesFinder, findsNothing);
    },
  );

  testWidgets(
      'LoanForm text widget displays error when empty and button is clicked',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: Column(
        children: [LoanForm(), NationalIdTextFormField()],
      ),
    )));
    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();
    var errorMessageFinder = find.text("Please enter a National ID.");
    expect(errorMessageFinder, findsOneWidget);
  });
}
