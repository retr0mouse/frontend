import 'package:flutter/material.dart';

import 'colors.dart';

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  foregroundColor: AppColors.secondaryColor,
  textStyle: const TextStyle(
      fontSize: 20, color: AppColors.textColor), // Button's text style
  shape: const RoundedRectangleBorder(
    // Button's shape
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  padding: const EdgeInsets.all(12.0), // Inner padding of the button
);
