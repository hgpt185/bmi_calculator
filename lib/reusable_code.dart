import 'package:flutter/material.dart';

class reusablecode extends StatelessWidget {
  reusablecode({@required this.colour, this.cardchild, this.onPressed});

  final Color colour;
  final Widget cardchild;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
