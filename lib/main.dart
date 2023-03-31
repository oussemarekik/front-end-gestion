import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:project_management_frontend/app/core/utils/constant.dart';
import 'package:project_management_frontend/app/core/utils/deeplink.dart';
import 'package:project_management_frontend/app/core/values/languages/language.dart';
import 'package:project_management_frontend/app/data/providers/storage_provider.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  StorageHelper storage = StorageHelper();
  String? locale = await storage.fetchItem(storageLocale);
  runApp(
    GetMaterialApp(
      title: "Project management",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: Language(),

      locale: Locale(locale ?? "fr_FR"),
      builder: EasyLoading.init(),
      onReady: () {
        if(!kIsWeb){
          DeepLinkController.initUniLinks();
        }
      },
      onDispose: () {
        if(!kIsWeb) {
          DeepLinkController.closeSubscriptionDeepLink();
        }
      },

    ),
  );
}