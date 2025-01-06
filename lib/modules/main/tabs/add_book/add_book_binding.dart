import 'package:book_portal/modules/main/tabs/add_book/add_book_controller.dart';
import 'package:get/get.dart';

class AddBookBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddBookController());
  }
}
