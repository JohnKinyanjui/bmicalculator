import 'package:flutter/material.dart';

import 'constants.dart';

class IconContentWidget extends StatelessWidget {
  const IconContentWidget({ @required this.icon,@required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 80,
          color: Colors.white,),
        SizedBox(height: 15),
        Text(label, style: labelStyle,),

      ],
    );
  }
}