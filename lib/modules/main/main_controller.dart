import 'package:book_portal/modules/main/tabs/add_book/add_book_binding.dart';
import 'package:book_portal/modules/main/tabs/add_book/add_book_view.dart';
import 'package:book_portal/modules/main/tabs/cart/cart_binding.dart';
import 'package:book_portal/modules/main/tabs/cart/cart_view.dart';
import 'package:book_portal/modules/main/tabs/home/home_binding.dart';
import 'package:book_portal/modules/main/tabs/home/home_view.dart';
import 'package:book_portal/modules/main/tabs/profile/profile_binding.dart';
import 'package:book_portal/modules/main/tabs/profile/profile_view.dart';
import 'package:book_portal/modules/main/tabs/search_book/search_binding.dart';
import 'package:book_portal/modules/main/tabs/search_book/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class MainController extends GetxController {
  var currentTabIndex = 0.obs;
  var pageIndex = 0.obs;
  var pageList = <String>[].obs;
  var currenctNavigatorKey = 0.obs;
  var navigatorKeyList = <GlobalKey<NavigatorState>>[].obs;

  DateTime? currentBackPressTime;
  String? homePage;
  String? searchPage;
  String? addPage;
  String? cartPage;
  String? profilePage;

  void switchTab(int index) async {
    currentTabIndex.value = index;
    switch (index) {
      case 0:
        if (!pageList.contains(homePage)) {
          pageList.add(homePage!);
          navigatorKeyList.add(Get.nestedKey(AppRoutes.id1)!);
        }
        pageIndex.value = pageList.indexOf(homePage);
        currenctNavigatorKey.value =
            navigatorKeyList.indexOf(Get.nestedKey(AppRoutes.id1));

        // if (Get.nestedKey(AppRoutes.id1)!.currentState != null) {
        //   if (await Get.nestedKey(AppRoutes.id1)!.currentState!.maybePop()) {
        //     Get.until((route) => route.isFirst, id: AppRoutes.id1);
        //   }
        // }
        // if (await Get.nestedKey(AppRoutes.id1)!.currentState!.maybePop()) {
        //   Get.until((route) => route.isFirst, id: AppRoutes.id1);
        // }
        break;
      case 1:
        if (!pageList.contains(searchPage)) {
          pageList.add(searchPage!);
          navigatorKeyList.add(Get.nestedKey(AppRoutes.id2)!);
        }
        pageIndex.value = pageList.indexOf(searchPage);
        currenctNavigatorKey.value =
            navigatorKeyList.indexOf(Get.nestedKey(AppRoutes.id2));
        // if (Get.nestedKey(AppRoutes.id2)!.currentState != null) {
        //   if (await Get.nestedKey(AppRoutes.id2)!.currentState!.maybePop()) {
        //     Get.until((route) => route.isFirst, id: AppRoutes.id2);
        //   }
        // }
        // if (await Get.nestedKey(AppRoutes.id2)!.currentState!.maybePop()) {
        //   Get.until((route) => route.isFirst, id: AppRoutes.id2);
        // }
        break;
      case 2:
        if (!pageList.contains(addPage)) {
          pageList.add(addPage!);
          navigatorKeyList.add(Get.nestedKey(AppRoutes.id3)!);
        }
        pageIndex.value = pageList.indexOf(addPage);
        currenctNavigatorKey.value =
            navigatorKeyList.indexOf(Get.nestedKey(AppRoutes.id3));
        // if (Get.nestedKey(AppRoutes.id3)!.currentState != null) {
        //   if (await Get.nestedKey(AppRoutes.id3)!.currentState!.maybePop()) {
        //     Get.until((route) => route.isFirst, id: AppRoutes.id3);
        //   }
        // }
        break;
      case 3:
        if (!pageList.contains(cartPage)) {
          pageList.add(cartPage!);
          navigatorKeyList.add(Get.nestedKey(AppRoutes.id4)!);
        }
        pageIndex.value = pageList.indexOf(cartPage);
        currenctNavigatorKey.value =
            navigatorKeyList.indexOf(Get.nestedKey(AppRoutes.id4));
        // if (Get.nestedKey(AppRoutes.id4)!.currentState != null) {
        //   if (await Get.nestedKey(AppRoutes.id4)!.currentState!.maybePop()) {
        //     Get.until((route) => route.isFirst, id: AppRoutes.id4);
        //   }
        // }
        break;
      case 4:
        if (!pageList.contains(profilePage)) {
          pageList.add(profilePage!);
          navigatorKeyList.add(Get.nestedKey(AppRoutes.id5)!);
        }
        pageIndex.value = pageList.indexOf(profilePage);
        currenctNavigatorKey.value =
            navigatorKeyList.indexOf(Get.nestedKey(AppRoutes.id5));
        // if (Get.nestedKey(AppRoutes.id5)!.currentState != null) {
        //   if (await Get.nestedKey(AppRoutes.id5)!.currentState!.maybePop()) {
        //     Get.until((route) => route.isFirst, id: AppRoutes.id5);
        //   }
        // }
        break;
      default:
    }
  }

  Route? onGenerateRoute(RouteSettings settings, String tabItem) {
    if (tabItem == AppRoutes.home) {
      return getPageRoute(
        settings,
        const HomeView(),
        binding: HomeBinding(),
      );
    } else if (tabItem == AppRoutes.search) {
      return getPageRoute(
        settings,
        const SearchView(),
        binding: SearchBinding(),
      );
    } else if (tabItem == AppRoutes.add) {
      return getPageRoute(
        settings,
        const AddBookView(),
        binding: AddBookBinding(),
      );
    } else if (tabItem == AppRoutes.cart) {
      return getPageRoute(
        settings,
        const CartView(),
        binding: CartBinding(),
      );
    } else if (tabItem == AppRoutes.profile) {
      return getPageRoute(
        settings,
        const ProfileView(),
        binding: ProfileBinding(),
      );
    }
    return null;
  }

  GetPageRoute getPageRoute(RouteSettings appRoutesettings, Widget page,
      {Bindings? binding}) {
    return GetPageRoute(
      settings: appRoutesettings,
      page: () => page,
      binding: binding,
    );
  }

  @override
  void onInit() {
    homePage = AppRoutes.home;
    searchPage = AppRoutes.search;
    addPage = AppRoutes.add;
    cartPage = AppRoutes.cart;
    profilePage = AppRoutes.profile;
    pageList.add(homePage!);

    navigatorKeyList.add(Get.nestedKey(AppRoutes.id1)!);
    // navigatorKeyList.add(Get.nestedKey(AppRoutes.id2)!);
    // navigatorKeyList.add(Get.nestedKey(AppRoutes.id3)!);
    super.onInit();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      // EasyLoading.showToast(StringConstant.pressthebackbuttontoexit);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
