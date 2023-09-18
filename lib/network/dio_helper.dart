import 'package:dio/dio.dart';
import 'package:e_commerce/network/end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseurl,
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String? token,
      String lang = 'en'}) async {
    dio?.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
      'lang': lang
    };
    return await dio!.get(url, queryParameters: query,);
  }

  static Future<Response?> postData(
      {required String url,
      Map<String, dynamic>? query,
      String? token,
      String lang = 'en',
      required Map<String, dynamic> data}) async {
    dio?.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
      'lang': lang
    };
    final response = await dio?.post(
      url,
      data: data,
      queryParameters: query,
    );
    return response;
  }

  static Future<Response?> putData(
      {required String url,
        Map<String, dynamic>? query,
        String? token,
        String lang = 'en',
        required Map<String, dynamic> data}) async {
    dio?.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
      'lang': lang
    };
    final response = await dio?.put(
      url,
      data: data,
      queryParameters: query,
    );
    return response;
  }


}
