import 'package:flutter/material.dart';
import 'package:project_management_frontend/app/data/enums/button_type.dart';
import 'package:get/get.dart';
import '../../../global_widgets/molecules/molecule_label_input.dart';
import '../../../global_widgets/templates/app_scaffold.dart';
import '../controllers/login_controller.dart';
import '../../../global_widgets/molecules/molecule_label_button.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "login",
      body:Form(
        key: controller.formKey,
        child: Column(
        children: [
          MoleculeLabelInput(backgroundColor:Colors.red,text: "name",controller: controller.myController,),
          MoleculeLabelInput(backgroundColor:Colors.black,text: "password",controller: controller.myController1,isObscureText: true),
          MoleculeLabelButton(
            text: "login" ,
            onPressed: controller.login,
            buttonColor: ButtonColor.blue,
          ),
        ],
        ),
      )
    );
  }



}
