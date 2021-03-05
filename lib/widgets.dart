import 'package:flutter/material.dart';

Widget appBar(BuildContext context)
{
  return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 22.0),
        children: [
          TextSpan(
            text: 'Tip',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black45
            )
          ),
          TextSpan(
            text: ' Calculator',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white54
            )
          ),
        ]
      )
  );
}