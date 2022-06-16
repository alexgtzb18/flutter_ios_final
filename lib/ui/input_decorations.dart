import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    required IconData prefixIcon,
  }) {
    return InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefixIcon,),
        labelStyle: TextStyle(color: Colors.blue),
        hintStyle: TextStyle(color: Colors.grey.shade400));
  }
}
