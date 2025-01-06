import 'package:get/get.dart';

import 'api_provider.dart';

class ApiRepository {
  final ApiProvider apiProvider;

  ApiRepository({required this.apiProvider});

  Future getData() async {
    var res = await apiProvider.getMethod('/users');

    if (res != null && res.data != null) {
      return res;
    } else {
      return null;
    }
  }
}
