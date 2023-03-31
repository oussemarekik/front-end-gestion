import 'package:flutter/material.dart';

import '../atoms/atom_text_field.dart';
import '../atoms/atom_label.dart';
class MoleculeLabelInput extends StatelessWidget
{
  final Color backgroundColor;
  final String text;
  final bool isObscureText;

  final TextEditingController? controller;
  MoleculeLabelInput({this.backgroundColor = Colors.red,this.text="",this.controller,this.isObscureText=false});
  @override
  Widget build(BuildContext context)
  {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AtomLabel(text: text),
          AtomTextField(controller: controller,
            hintText: "tttttt",
            withBorder: true,
            isObscureText: isObscureText,
            isRequired: true,
          ),
        ],
      ),
    );
  }
}