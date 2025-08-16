import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import '../../utils/global_var.dart';
import '../constants/hive_keys.dart';
import 'api_config.dart';

enum RequestMethod {
  POST,
  GET,
  PUT,
  PATCH,
  DELETE,
}

class ApiService {
  static late dio.CancelToken cancelToken;
  static int? lastStatusCode;

  static Future<ApiResponse> request(
      String path, {
        required RequestMethod method,
        dynamic data,
        Map<String, dynamic>? queryParameters,
        bool formData = false,
        Function(int, int)? onSendProgress,
        String languageHeader = 'Accept-Language',
        String defaultLang = 'en',
      }) async {
    return await _sendRequest(
      path: path,
      method: method,
      data: data,
      queryParameters: queryParameters,
      formData: formData,
      onSendProgress: onSendProgress,
      languageHeader: languageHeader,
      defaultLang: defaultLang,
    );
  }

  static Future<ApiResponse> _sendRequest({
    required String path,
    required RequestMethod method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool formData = false,
    Function(int, int)? onSendProgress,
    required String languageHeader,
    required String defaultLang,
  }) async {
    try {
      final dioInstance = ApiConfig().dio;
      dioInstance.options.headers[HttpHeaders.authorizationHeader] =
          box.get(HiveKeys.authToken);
      dioInstance.options.headers[languageHeader] =
          box.get(HiveKeys.language, defaultValue: defaultLang);
      dioInstance.options.headers["Accept"] = "application/json";
      dioInstance.options.method = method.name;
      cancelToken = dio.CancelToken();
      final response = await dioInstance.request(
        path,
        data: data == null
            ? null
            : formData
            ? dio.FormData.fromMap(data)
            : data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );

      lastStatusCode = response.statusCode;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return ApiResponse.success(response.data);
      } else {
        final message = response.statusMessage ?? "error";
        return ApiResponse.failure(message, response.statusCode);
      }
    } on dio.DioException catch (e) {
      lastStatusCode = e.response?.statusCode;
      log("$path >>>>> ${e.response}");
      final message = e.response?.data['message'] ?? "error";
      return ApiResponse.failure(message, lastStatusCode);
    } on SocketException catch (_) {
      lastStatusCode = null;
      return ApiResponse.failure('no_internet_connection', null);
    }
  }
}

class ApiResponse {
  final bool isSuccess;
  final dynamic data;
  final String? errorMessage;
  final int? statusCode;

  ApiResponse.success(this.data)
      : isSuccess = true,
        errorMessage = null,
        statusCode = null;

  ApiResponse.failure(this.errorMessage, this.statusCode)
      : isSuccess = false,
        data = null;
}
