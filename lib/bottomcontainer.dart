import 'package:flutter/material.dart';
import 'result_page.dart';
import 'constants.dart';

class Botton_Container extends StatelessWidget {
  Botton_Container({@required this.text, @required this.onTap});
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        color: kbottoncontainercolor,
        child: Center(
          child: Text(
            text,
            style: kBottomContainertextstyle,
          ),
        ),
      ),
    );
  }
}
