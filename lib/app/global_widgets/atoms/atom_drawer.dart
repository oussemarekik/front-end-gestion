import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/text_theme.dart';
import 'package:project_management_frontend/app/data/services/auth_service.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_menu_item.dart';
import 'package:get/get.dart';
import 'package:project_management_frontend/app/routes/app_pages.dart';
class AtomDrawer extends StatelessWidget {
  const AtomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 4.0),
              child: Align(
                child: IconButton(
                  icon: SvgPicture.asset(
                      'assets/icons/menu_icons/close_menu.svg'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                alignment: Alignment.topRight,
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  const SizedBox(
                    height: 40.0,
                  ),
                  AtomMenuItem(
                    label: 'my-profile'.tr,
                    iconMenu: 'assets/icons/menu_icons/profile_menu.svg',
                    onTap: () => Get.toNamed(Routes.HOME),
                  ),
                  AtomMenuItem(
                      label: 'legal-mentions'.tr,
                      iconMenu:
                      'assets/icons/menu_icons/legal_mentions_menu.svg',
                      onTap: () => Get.toNamed(Routes.HOME)),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 19.0),
                      child: TextButton(
                          onPressed: () {
                            AuthService().logout();
                            Get.offAllNamed(Routes.LOGIN);
                            },
                          child: Column(
                            children: [
                              Text(
                                'logout'.tr,
                                style: styleThirdColorFontRobotoW400Size16,
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
