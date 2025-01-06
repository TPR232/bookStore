import 'package:book_portal/shared/services/storage_service.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static Future init() async {
    await Get.putAsync(() => StorageService().init());
  }
}
