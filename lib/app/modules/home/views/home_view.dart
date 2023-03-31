import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_button.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_card_info.dart';
import 'package:project_management_frontend/app/global_widgets/templates/app_scaffold.dart';
import '../controllers/home_controller.dart';
import 'package:project_management_frontend/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: 'HomeView',
      withMenu: true,
      body:  Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: [
            //AtomCardInfo(withAnimatedIcon: true, text: 'Loading',),
            AtomButton(label: "Project",onPressed: (){Get.offAllNamed(Routes.PROJECT);},)
          ],
        ),
      ),
    );
  }
}