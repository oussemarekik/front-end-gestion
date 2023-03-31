import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_management_frontend/app/core/utils/helpers.dart';
import 'package:project_management_frontend/app/core/values/colors.dart';
import '../../core/theme/text_theme.dart';
import 'package:project_management_frontend/app/data/enums/button_type.dart';

class AtomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final ButtonColor buttonColor;
  final Color? textColor;
  final bool isSmall;
  final bool withForwardIcon;
  final bool withBackIcon;
  final bool withPlusIcon;
  final bool blueBorder;

  const AtomButton({
    Key? key,
    required this.label,
    this.buttonColor = ButtonColor.blue,
    this.blueBorder = false,
    this.onPressed,
    this.isSmall = false,
    this.withForwardIcon = false,
    this.withBackIcon = false,
    this.withPlusIcon = false,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isExtraSmall(context) ? 8.0 : 30.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (withPlusIcon) SvgPicture.asset('assets/icons/plus_icon.svg'),
              if (withBackIcon)
                SvgPicture.asset('assets/icons/arrow_back_icon.svg'),
              Padding(
                padding: EdgeInsets.only(
                    left: withBackIcon || withPlusIcon ? 10.0 : 0.0,
                    right: withForwardIcon ? 10.0 : 0.0),
                child: Text(label,
                    style: TextStyle(
                        color: getLabelColor(buttonColor))),
              ),
              if (withForwardIcon)
                SvgPicture.asset('assets/icons/arrow_forward_icon.svg'),
            ],
          ),
        ),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            minimumSize: MaterialStateProperty.all(
                isSmall ? const Size(130, 51) : const Size.fromHeight(51)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(
                    color: blueBorder ? primaryColor : Colors.transparent))),
            textStyle: MaterialStateProperty.all(styleFontBebasW400Size18),
            shadowColor: MaterialStateProperty.all(white15),
            foregroundColor:
                MaterialStateProperty.all(getOnPressedColor(buttonColor)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return getOnPressedColor(buttonColor);
              }else if (states.contains(MaterialState.disabled)) {
                return grey15;
              }
              return getButtonColor(buttonColor);
            })));
  }

  getOnPressedColor(ButtonColor buttonColor) {
    switch (buttonColor) {
      case ButtonColor.blue:
        return primaryColor.withOpacity(0.7);
      case ButtonColor.white:
        return black.withOpacity(0.005);
      case ButtonColor.orange:
        return thirdColor.withOpacity(0.7);
      case ButtonColor.grey15:
        return white.withOpacity(0.7);
    }
  }

  getLabelColor(ButtonColor buttonColor) {
    if(onPressed == null){
      return white20;
    }

    if(textColor != null){
      return textColor;
    }
      switch (buttonColor) {
        case ButtonColor.white:
          return primaryColor;

        case ButtonColor.orange:
          return white;

        case ButtonColor.blue:
          return white;

        case ButtonColor.grey15:
          return white;
      }
  }

  getButtonColor(ButtonColor buttonColor) {
    if(onPressed == null){
      return white10;
    }


    switch (buttonColor) {
      case ButtonColor.white:
        return white;

      case ButtonColor.orange:
        return thirdColor;

      case ButtonColor.blue:
        return primaryColor;

      case ButtonColor.grey15:
        return grey15;
    }
  }
}
