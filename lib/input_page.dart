import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Gender_icon.dart';
import 'reusable_code.dart';
import 'result_page.dart';
import 'roundiconbutton.dart';
import 'bottomcontainer.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecolor = kinactiveicontainercolor;
  Color femalecolor = kinactiveicontainercolor;
  Gender selectedgender;

  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black45,
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusablecode(
                    onPressed: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    cardchild: GenderIcon(
                      icon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                    colour: selectedgender == Gender.male
                        ? kactiveicontainercolor
                        : kinactiveicontainercolor,
                  ),
                ),
                Expanded(
                  child: reusablecode(
                    onPressed: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    cardchild: GenderIcon(
                      icon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                    colour: selectedgender == Gender.female
                        ? kactiveicontainercolor
                        : kinactiveicontainercolor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusablecode(
              colour: kactiveicontainercolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: klabeltextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kheavytextstyle,
                      ),
                      Text(
                        'cm',
                        style: klabeltextstyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: kbottoncontainercolor,
                    inactiveColor: Color(0xFFBD8E98),
                    onChanged: (double newheight) {
                      setState(() {
                        height = newheight.toInt();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusablecode(
                    colour: kactiveicontainercolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabeltextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kheavytextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reusablecode(
                    colour: kactiveicontainercolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabeltextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: kheavytextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Botton_Container(
            text: 'CALCULATE',
            onTap: () {
              Calculator_brain cal = Calculator_brain(
                  height: height.toDouble(), weight: weight.toDouble());
              cal.calculate_BMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Results_page(
                      result: cal.get_result(),
                      interpretation: cal.get_interpretation(),
                      bmi: cal.calculate_BMI(),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
