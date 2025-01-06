import 'package:book_portal/modules/main/tabs/home/widgets/detail.dart';
import 'package:book_portal/routes/app_routes.dart';
import 'package:book_portal/shared/widgets/common_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.start.value
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Center(
                  child: Text('data'),
                )
              ],
            ),
    );
  }
}
