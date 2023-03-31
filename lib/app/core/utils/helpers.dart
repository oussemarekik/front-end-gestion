import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_management_frontend/app/core/values/colors.dart';
import '../theme/text_theme.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_alert_dialog.dart';

bool isExtraSmall(context){
  return MediaQuery.of(context).size.width <= 320 || MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
}

showAlertDialog({String? iconSvg, String? title, TextStyle? titleStyle, String? subTitle, TextAlign? subTitleAlign, Widget? content, List<Widget> actions = const [], Function()? onClose}) {
  if (Get.context != null) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AtomAlertDialog(
          iconSvg: iconSvg,
          title: title,
          titleStyle: titleStyle,
          subTitle: subTitle,
          content: content,
          actions: actions,
          onClose: onClose,
          subTitleAlign: subTitleAlign,
        );
      },
    );
  }
}

showAtomSnackBar({required String title, required String message, bool isSucceed = false, Duration? duration }) {
  return GetSnackBar(
    titleText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr,
          style: styleBlackLightFontRobotoW500Size18,
        ),
        InkWell(
          onTap: () => Get.closeCurrentSnackbar(),
          child: SvgPicture.asset(
            "assets/icons/close.svg",
            width: 24,
            height: 24,
            color: blackLight,
          ),
        ),
      ],
    ),
    messageText: Text(
      message.tr,
      style: styleBlackLightFontRobotoW400Size16,
    ),
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.only(
      left: 8,
      right: 8,
      top: 85,
    ),
    padding: const EdgeInsets.only(top: 13, bottom: 16, left: 20.55, right: 13),
    backgroundColor: white,
    duration: duration,
    borderRadius: 10,
    icon: SvgPicture.asset(
      isSucceed? "assets/icons/check.svg" : "assets/icons/close.svg",
      width: 30,
      height: 30,
    ),
    boxShadows: const [BoxShadow(color: white15, blurRadius: 1)],
  );
}

showErrors(Map<String, dynamic> data) {

  showAlertDialog(
    title: data["message"] ?? "",
    subTitle: data["errors"] ?? "",
    subTitleAlign: TextAlign.start
  );

}
