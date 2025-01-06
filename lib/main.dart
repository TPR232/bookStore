import 'package:book_portal/app_binding.dart';
import 'package:book_portal/di.dart';
import 'package:book_portal/routes/app_pages.dart';
import 'package:book_portal/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
  await DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.main,
      getPages: AppPages.pages,
      initialBinding: AppBinding(),
    );
  }
}
