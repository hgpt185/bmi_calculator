import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottomcontainer.dart';

class Results_page extends StatelessWidget {
  Results_page({this.bmi, this.interpretation, this.result});

  String result;
  String bmi;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15),
                child: Text(
                  'Your Result',
                  style: kResultpagetextstyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: reusablecode(
                  colour: kactiveicontainercolor,
                  cardchild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        result,
                        style: kResulttext,
                      ),
                      Text(
                        bmi,
                        style: kBmi,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Botton_Container(
              text: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
