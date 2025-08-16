import 'package:dio/dio.dart';
import 'api_paths.dart';

class ApiConfig {
  static final ApiConfig _singleton = ApiConfig._internal();
  factory ApiConfig() => _singleton;

  late Dio dio;

  ApiConfig._internal() {
    dio = Dio();
    dio.options.baseUrl = ApiPaths.baseURL;
    dio.options.connectTimeout = Duration(milliseconds: 120000);
    dio.options.receiveTimeout = Duration(milliseconds: 120000);
  }
}