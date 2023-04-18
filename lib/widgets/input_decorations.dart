import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColors.firebaseOrange),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.red),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: CustomColors.firebaseOrange)
            : null);
  }
}
