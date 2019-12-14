import 'package:bmicalculator/Components/ReusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/Components/bottom_button.dart';
import 'package:bmicalculator/Components/bottom_button.dart';

import '../Components/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),centerTitle: true,),
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Expanded(
             child: Center(
               child: Container(
                 child: Text("Your Result", style: headStyle,),
               ),
             ),
           ),
           Expanded(
             flex: 5,
               child: Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: ReusableCard(
                   cardChild: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       Text(resultText.toUpperCase(), style: labelStyle2,),
                       Text(bmiResult, style: TextStyle(color: Colors.white, fontSize: 100,fontWeight: FontWeight.bold),),
                       Text(interpretation, style: labelStyle3,textAlign: TextAlign.center,),

                     ],
                   ), coluor: activeCardColour,
                 ),
               ),
           ),
           Expanded(
             child: BottomButton(onPress: (){
               Navigator.pop(context);
               },
               text: "RECALCULATE")

           )
         ],
       ),
    );
  }
}
