// This file defines a `LoanAmountField` widget which is a stateful widget
// that displays a loan application form.

import 'package:flutter/material.dart';

import '../colors.dart';

class LoanAmountField extends StatelessWidget {
  final int loanAmount;
  final ValueChanged<int> onChanged;

  const LoanAmountField({
    Key? key,
    required this.loanAmount,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Loan Amount: $loanAmount €'),
        const SizedBox(height: 8),
        Slider.adaptive(
          value: loanAmount.toDouble(),
          min: 2000,
          max: 10000,
          divisions: 80,
          label: '$loanAmount €',
          activeColor: AppColors.secondaryColor,
          onChanged: (double newValue) {
            onChanged((newValue.floor() / 100).round() * 100);
          },
        ),
      ],
    );
  }
}

class LoanPeriodField extends StatelessWidget {
  final int loanPeriod;
  final ValueChanged<int> onChanged;

  const LoanPeriodField({
    Key? key,
    required this.loanPeriod,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Loan Period: $loanPeriod months'),
        const SizedBox(height: 8),
        Slider.adaptive(
          value: loanPeriod.toDouble(),
          min: 12,
          max: 60,
          divisions: 40,
          label: '$loanPeriod months',
          activeColor: AppColors.secondaryColor,
          onChanged: (double newValue) {
            onChanged((newValue.floor() / 6).round() * 6);
          },
        ),
        // ... other widgets ...
      ],
    );
  }
}