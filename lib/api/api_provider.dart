import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio = Dio();

  Dio init(String url, {isMultiplePart = false}) {
    Map<String, dynamic>? headers = {
      Headers.acceptHeader: 'application/json',
      Headers.contentTypeHeader:
          isMultiplePart ? 'multipart/form-data' : 'application/json',
    };

    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.github.com',
      headers: headers,
    );

    dio.options = options;

    return dio;
  }

  Response? response;

  Future<Response?> getMethod(String path,
      {Map<String, dynamic>? query, Map<String, dynamic>? data}) async {
    dio = init(path);

    try {
      Response res = await dio.get(
        path,
        queryParameters: query,
      );

      if (res.statusCode == 200 && res.data != null) {
        response = res;
      }

      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
