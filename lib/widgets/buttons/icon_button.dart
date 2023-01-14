import 'package:flutter/material.dart';

class DagdaIconButton extends StatelessWidget {
  const DagdaIconButton(
      {super.key,
      this.colour = Colors.black,
      required this.icon,
      required this.onPressed,
      this.iconSize = 24,
      this.borderRadius = 10,
      this.borderWidth = 2});

  final Color colour;
  final Icon icon;
  final Function onPressed;
  final double iconSize;
  final double borderRadius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: colour,
        minimumSize: const Size(50, 50),
        side: BorderSide(color: colour, width: borderWidth),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
      iconSize: iconSize,
      icon: icon,
    );
  }
}
