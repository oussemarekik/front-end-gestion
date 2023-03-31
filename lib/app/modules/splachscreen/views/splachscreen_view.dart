import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/values/colors.dart';
import '../../../data/services/auth_service.dart';
import '../../../routes/app_pages.dart';
import '../controllers/splachscreen_controller.dart';

class SplashScreenView extends GetView<SplachscreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return FlameSplashScreen(
        controller: FlameSplashController(
          waitDuration: const Duration(seconds: 4),
        ),
        theme: FlameSplashTheme(
          logoBuilder: (context) {
            return Image.asset(
              'assets/images/splash_screen.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            );
          },
          backgroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor,
                  secondColor,
                ],
              )),
        ),
        onFinish: (BuildContext context) async {
          AuthService authService = AuthService();
          bool appAuth = await authService.isLoggedIn();

          print("a***************************ppAuth");
          print(appAuth);
          Get.offAllNamed(
            Routes.HOME,
          );
        });
  }
}