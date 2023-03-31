import 'package:get/get.dart';
import 'package:project_management_frontend/app/data/models/app_auth.dart';
import 'package:project_management_frontend/app/data/services/auth_service.dart';
import 'package:project_management_frontend/app/data/services/auth_service.dart';
import 'package:project_management_frontend/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:project_management_frontend/app/routes/app_pages.dart';
class LoginController extends GetxController {
  //TODO: Implement LoginController
  final  username ="".obs;
  final password="".obs;
  final AuthService auth=AuthService();
  dynamic access=false;

  final myController=TextEditingController();
  final myController1=TextEditingController();
  final GlobalKey<FormState> formKey= GlobalKey();

  login() async {
    if(formKey.currentState!.validate()){
      AppAuth user=AppAuth(username:myController.text,password: myController1.text);
      bool response= await auth.customerAuth(auth:user);
      if(response){
        Get.offNamed(Routes.HOME);
      }
    }
  }

  updateStoreEmail(String email) {
    this.username(email);
  }


  updateStorePassword(String password)
  {
    this.password(password);
  }

  void onChange()
  {

  }
  @override
  void onInit() {
    print("on init Login ");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  affiche(){
    print("hathi hya x) ${myController1.text}");
  }
}
