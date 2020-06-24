import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double iconSize;// = 20.0;
  final IconData icon;
  final Function onTap;

  CustomIconButton({@required this.icon, @required this.onTap, this.iconSize = 40});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        icon,
        size: iconSize,
      ),
      onTap: onTap,
    );
  }
}
