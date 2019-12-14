import 'package:bmicalculator/screens/resultpage.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({@required this.onPress,@required this.text});
  final Function onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          color: bottomContainerCardColor,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: bottomContainerHeight,
          child: Center(
            child: Text(text,style: labelStyle4,)
          )
      ),
    );
  }
}