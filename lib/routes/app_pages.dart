import 'package:book_portal/modules/auth/login/login_binding.dart';
import 'package:book_portal/modules/auth/login/login_view.dart';
import 'package:book_portal/modules/main/main_binding.dart';
import 'package:book_portal/modules/main/main_tab.dart';
import 'package:get/get.dart';

import './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => MainTab(),
      binding: MainBinding(),
    ),
  ];
}
