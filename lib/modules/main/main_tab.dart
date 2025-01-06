import 'package:book_portal/modules/main/main_controller.dart';
import 'package:book_portal/shared/constants/color_constants.dart';
import 'package:book_portal/shared/utils/match_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../shared/constants/svg_image_constants.dart';

class MainTab extends GetView<MainController> {
  const MainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        final isFirstRouteInCurrentTab = !await controller
            .navigatorKeyList[controller.currenctNavigatorKey.value]
            .currentState!
            .maybePop();

        // if (isFirstRouteInCurrentTab) {
        //   return controller.onWillPop();
        // } else {
        //   return isFirstRouteInCurrentTab;
        // }
      },
      child: Obx(
        () => SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                controller.switchTab(value);
              },
              currentIndex: controller.currentTabIndex.value,
              fixedColor: ColorConstants.kPrimary,
              showSelectedLabels: true,
              unselectedLabelStyle: TextStyle(
                color: ColorConstants.black,
              ),
              items: bottomNavigationBar(),
            ),
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: List<Widget>.generate(
                controller.pageList.length,
                (int index) {
                  return Navigator(
                    key: controller.navigatorKeyList[index],
                    onGenerateRoute: (RouteSettings settings) {
                      return controller.onGenerateRoute(
                        settings,
                        controller.pageList[index],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<BottomNavigationBarItem> bottomNavigationBar() {
  return [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        SvgImageConstant.homeButton,
        height: getSize(25),
      ),
      activeIcon: SvgPicture.asset(
        SvgImageConstant.homeFillButton,
        height: getSize(25),
        color: ColorConstants.kPrimary,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        SvgImageConstant.searchButton,
        height: getSize(25),
      ),
      activeIcon: SvgPicture.asset(
        SvgImageConstant.searchButton,
        height: getSize(25),
        color: ColorConstants.kPrimary,
      ),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        SvgImageConstant.addButton,
        height: getSize(25),
      ),
      activeIcon: SvgPicture.asset(
        SvgImageConstant.addFillButton,
        height: getSize(25),
        color: ColorConstants.kPrimary,
      ),
      label: 'Add',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        SvgImageConstant.cartButton,
        height: getSize(25),
      ),
      activeIcon: SvgPicture.asset(
        SvgImageConstant.cartFillButton,
        height: getSize(25),
        color: ColorConstants.kPrimary,
      ),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        SvgImageConstant.profileIcon,
      ),
      activeIcon: SvgPicture.asset(
        SvgImageConstant.profileWithFill,
      ),
      label: 'Profile',
    ),
  ];
}
