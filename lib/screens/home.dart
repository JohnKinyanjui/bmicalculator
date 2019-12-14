import 'package:bmicalculator/Components/ReusableCard.dart';
import 'package:bmicalculator/Components/bottom_button.dart';
import 'package:bmicalculator/Components/constants.dart';
import 'package:bmicalculator/Components/icon_content_widget.dart';
import 'package:bmicalculator/screens/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/calculator_brain.dart';


enum Gender{
  male,female
}
// ignore: camel_case_types
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {

  Gender selectedGender ;
  int height =180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                    child: new ReusableCard(
                      cardChild: new IconContentWidget(icon: FontAwesomeIcons.mars,label: "MALE",),
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                          print("is Working");
                        });

                      },
                      coluor: selectedGender == Gender.male ? activeCardColour : inactiveCardColour,
                    ),
                  

              ),
              Expanded(
                child: new ReusableCard(
                cardChild: new IconContentWidget(icon: FontAwesomeIcons.venus, label: "FEMALE"),
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  coluor: selectedGender == Gender.female ? activeCardColour : inactiveCardColour,
                )
              )
            ],
          )),
          Expanded(
         child: new ReusableCard(coluor: activeCardColour,
         cardChild: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text('HEIGHT',style: labelStyle,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.baseline,
               textBaseline: TextBaseline.alphabetic,
               children: <Widget>[
                 Text(height.toString(),style: headStyle, ),
                 Text('cm',style: TextStyle(color: Colors.white),)
               ],
             ),
             SliderTheme(
             child: Slider(value: height.toDouble(),
                 min: 120.0,
                 max: 220.0,
                 activeColor: Color(0xffeb1555),
                 inactiveColor: Color(0xff8d8e98),
                 onChanged: (double newValue ){
                  setState(() {
                    height = newValue.round();
                  });

                     print(newValue);
                 }), data: SliderTheme.of(context).copyWith(
               thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
               overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
               overlayColor: Color(0x15eb1555),
               activeTrackColor: Colors.white,
               thumbColor: Color(0x15eb1555)
             ),)
           ],
         ))),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new ReusableCard(coluor: activeCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("WEIGHT",style: labelStyle,),
                          Text(weight.toString(),style: headStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(
                                icon: FontAwesomeIcons.minus, onPress: (){
                                  setState(() {
                                    weight--;
                                  });

                              },),
                              SizedBox(width: 5,),
                              RoundButton(
                                icon: FontAwesomeIcons.plus, onPress: (){
                                  setState(() {
                                    weight++;
                                  });
                              },),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: new ReusableCard(coluor: activeCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("AGE", style: labelStyle,),
                          Text(age.toString(),style: headStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(
                              icon: FontAwesomeIcons.minus, onPress: (){
                                setState(() {
                                  age--;
                                });
                              },),
                              SizedBox(width: 10,),
                              RoundButton(
                                icon: FontAwesomeIcons.plus, onPress: (){
                                 setState(() {
                                   age++;
                                 });
                              },),
                            ],
                          )

                        ],
                      ),)
                  )
                ],
              )),
          BottomButton(onPress: (){

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute( builder: (context) => ResultPage(
              bmiResult: calc.calculatorBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),

              ) ));

          },
          text: "CALCULATE",)
        ],
      ),
    );
  }
}



class RoundButton extends StatelessWidget {
  RoundButton({this.icon, @required this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPress,
        shape: CircleBorder(),
        fillColor: inactiveCardColour,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
        ),
        
        child: Icon(
            icon
            , color: Colors.white
        ),

    );
  }
}



