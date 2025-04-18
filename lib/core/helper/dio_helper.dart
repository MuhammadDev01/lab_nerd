import 'package:dio/dio.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cached_helper.dart';

class DioHelper {
  static late Dio dio;
  static String key = '';

  static void init() {
    dio = Dio(
      BaseOptions(
        followRedirects: true,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    key,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${CachedHelper.getData(key: kOnLogging)}',
    };
    try {
      final response = await dio.get(
        url,
        queryParameters: query,
        data: data,
      );
      return response;
    } catch (error) {
      throw Exception('Error : $error');
    }
  }

  static Future<Response> postData({
    required String url,
    //String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${CachedHelper.getData(key: kOnLogging)}',
    };
    try {
      final response = await dio.post(
        url,
        queryParameters: query,
        data: data,
      );
      return response;
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  static Future<Response> putData({
    required String url,
    //String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${CachedHelper.getData(key: kOnLogging)}',
    };
    try {
      final response = await dio.put(
        url,
        queryParameters: query,
        data: data,
      );

      return response;
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}
