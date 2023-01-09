import 'package:flutter/material.dart';

class DagdaOutlinedButton extends StatelessWidget {
  const DagdaOutlinedButton(
      {super.key,
      this.colour = Colors.black,
      required this.title,
      required this.onPressed,
      this.fontSize = 18,
      this.fontWeight = FontWeight.bold,
      this.borderRadius = 10,
      this.borderWidth = 2});

  final Color colour;
  final String title;
  final Function onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: colour,
        minimumSize: const Size(100, 50),
        side: BorderSide(color: colour, width: borderWidth),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: colour,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
