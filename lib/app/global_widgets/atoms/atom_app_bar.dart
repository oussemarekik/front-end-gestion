import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_management_frontend/app/core/utils/constant.dart';
import 'package:project_management_frontend/app/core/values/colors.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_circular_button.dart';
import '../../core/theme/text_theme.dart';

class AtomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle style;
  final bool centerTitle;
  final bool withCloseIcon;
  final void Function()? onPressedSearch;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const AtomAppBar({
    Key? key,
    required this.title,
    this.style = styleBlackLightFontRobotoW400Size18,
    this.centerTitle = true,
    this.withCloseIcon = false,
    this.onPressedSearch,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      toolbarHeight: appBarHeight,
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircularButton(
              onPressed: onPressedSearch,
              icon: "assets/icons/research_icon.svg",
              tag: "btn2",
          ),
        ),
        if(withCloseIcon)
        IconButton(
          icon: SvgPicture.asset('assets/icons/menu_icons/close_menu.svg'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CircularButton(
            onPressed: () =>
                scaffoldKey?.currentState?.openDrawer(),
            icon: "assets/icons/menu_icon.svg",
            tag: "btn1",
        ),
      ),
      leadingWidth: 90,
      backgroundColor: grey,
      title: Text(
        title,
        style: style,
      ),
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, appBarHeight);
}
