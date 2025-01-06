import 'package:get/get.dart';

import '../../../../api/api_repository.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController(this.apiRepository);

  var list = [].obs;
  var start = false.obs;

  getData() async {
    var res = await apiRepository.getData();

    if (res != null) {
      start.value = false;
    }
    printInfo(info: "Get Data=>$res  ");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    start.value = true;
    getData();
  }
}
