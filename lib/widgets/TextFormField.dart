import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final Color color;
  final TextEditingController? controller;

  TextFormFieldWidget({
    required this.labelText,
    this.color = const Color(0xFF82D930),
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Assign the controller to the TextFormField
      cursorColor: Colors.blue, // Set cursor color to blue
      style: const TextStyle(
        color: Colors.white, // Input text color
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white), // Label text color
        enabledBorder: const OutlineInputBorder( // Border color by default
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder( // Border color when field is focused
          borderSide: BorderSide(color: color),
        ),
        // You can also adjust the fillColor and filled properties if you're using a filled TextField,
        // to ensure the background color contrasts well with the text.
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
    );
  }
}
