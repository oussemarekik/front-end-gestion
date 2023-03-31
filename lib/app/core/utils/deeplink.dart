import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_management_frontend/app/routes/app_pages.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';

class DeepLinkController{
  static StreamSubscription? _sub;
  static Future<void> initUniLinks() async {
    try {
      final initialLink = await getInitialLink();
      navigateTo(initialLink);
      _sub = linkStream.listen((String? link) {
        navigateTo(link);
      }, onError: (err) {
        throw err;
      });
    } on PlatformException {
      throw PlatformException;
    }
  }

  static closeSubscriptionDeepLink(){
    if(_sub != null){
      _sub!.cancel();
    }
  }

  static navigateTo(String? link){
    if(link != null && link.contains("laundry://reset-password")){
      List<String> args = link.split("otp=");
      Get.offAllNamed(Routes.HOME, parameters: { "otp": args.length >1 ? args[1] : "" });
    }else if(link != null && link.contains("laundry://confirm-email")){
      List<String> args = link.split("otp=");
      Get.offAllNamed(Routes.HOME, parameters: { "otp": args.length >1 ? args[1] : "" });
    }
  }
}