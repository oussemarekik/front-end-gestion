import 'package:flutter/material.dart';

class AtomLabel extends StatelessWidget
{
    String text;
    AtomLabel({this.text:"test"});
    @override
    Widget build(BuildContext context)
    {
        return Column(
          children: [
            Text(text,style: TextStyle(fontSize: 30),),
          ],
        );
    }
}