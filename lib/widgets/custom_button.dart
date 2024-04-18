import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final bool fill;
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.fill})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(widget.fill
            ? Color.fromARGB(230, 47, 196, 156)
            : Colors.transparent), // Set background color to transparent
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(100), // Adjust border radius as needed
            side: const BorderSide(
              color: Color.fromARGB(255, 47, 196, 156),
              width: 2,
            ),
          ),
        ),
      ),
      child: Text(widget.label,
        style: const TextStyle(
          color: Color.fromARGB(255, 219, 219, 219),
          fontFamily: "Roboto",
          fontSize: 16,
          fontWeight: FontWeight.normal,
        )
      )
    );
  }
}
