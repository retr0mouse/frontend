import 'package:flutter/material.dart';

import '../colors.dart';

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
          divisions: 48,
          label: '$loanPeriod months',
          activeColor: AppColors.secondaryColor,
          onChanged: (double newValue) {
            onChanged((newValue.floor() / 6).round() * 6);
          },
        ),
      ],
    );
  }
}