import 'package:flutter/material.dart';
import '../atoms/atom_button.dart';
import 'package:project_management_frontend/app/data/enums/button_type.dart';

class MoleculeLabelButton extends StatelessWidget
{

  String  text;

  final ButtonColor buttonColor;
  final void Function()? onPressed;
  MoleculeLabelButton({this.text="click x)",this.buttonColor=ButtonColor.orange,this.onPressed});

  @override
  Widget build(BuildContext context)
  {
    return AtomButton(label: text,buttonColor: buttonColor,onPressed:onPressed,);
  }

}