import 'package:get/get.dart';

import '../modules/edit_project/bindings/edit_project_binding.dart';
import '../modules/edit_project/views/edit_project_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/authguard/authguard.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/project/bindings/project_binding.dart';
import '../modules/project/views/ajoutproject.dart';
import '../modules/project/views/project_view.dart';
import '../modules/project/views/projectcontroller_view.dart';
import '../modules/reports/bindings/reports_binding.dart';
import '../modules/reports/views/reports_view.dart';
import '../modules/splachscreen/bindings/splachscreen_binding.dart';
import '../modules/splachscreen/views/splachscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  String? id = "159753";
  static const INITIAL = Routes.SPLACHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: _Paths.REPORTPROJECT,
        page: () => ProjectcontrollerView(),
        binding: ProjectBinding()),
    GetPage(
        name: _Paths.AJOUTPR,
        page: () => AjoutProject(),
        binding: ProjectBinding()),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      middlewares: [AuthGuard()],
    ),
    GetPage(
      name: _Paths.PROJECT,
      page: () => const ProjectView(),
      binding: ProjectBinding(),
    ),
    GetPage(
      name: _Paths.REPORTS,
      page: () => const ReportsView(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: _Paths.SPLACHSCREEN,
      page: () => const SplashScreenView(),
      binding: SplachscreenBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROJECT,
      page: () => const EditProjectView(),
      binding: EditProjectBinding(),
    ),
  ];
}
