import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shubham_practical/Core/app_string.dart';
import 'package:shubham_practical/Services/all_request.dart';
import 'package:shubham_practical/Services/app_url.dart';
import 'package:shubham_practical/Utils/logger.dart';
import 'package:shubham_practical/Utils/pref_utils.dart';

import 'reachability.dart';

class HttpResponse {
  bool? isSuccess;
  String message;
  dynamic data;

  HttpResponse({
    this.isSuccess,
    required this.message,
    this.data,
  });
}

class ResponseKeys {
  static String kisSuccess = 'isSuccess';
  static String kMessage = 'message';
  static String kData = 'data';
}

class ApiProvider {
  CancelToken? lastRequestToken;

  factory ApiProvider() {
    return _singleton;
  }

  final Dio dio = Dio();
  static final ApiProvider _singleton = ApiProvider._internal();

  ApiProvider._internal() {
    Logger().v("Instance created ApiProvider");

    /// Setting up connection and response time out
    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);
    dio.interceptors
        .add(PrettyDioLogger(requestHeader: true, requestBody: true));
  }

  Future<HttpResponse> _handleDioNetworkError(
      DioException error, String url) async {
    Logger().v("Error Details :: ${error.message}");

    return HttpResponse(
        isSuccess: false, message: AppString.somethingWentWrong, data: {});
  }

  HttpResponse _handleNetworkSuccess({required response}) {
    dynamic jsonResponse = response.data;

    final message = jsonResponse[ResponseKeys.kMessage] ?? '';
    final isSuccess = jsonResponse[ResponseKeys.kisSuccess] ?? false;
    final data = jsonResponse[ResponseKeys.kData] ?? {};

    if (response.statusCode == 200) {
      return HttpResponse(isSuccess: isSuccess, message: message, data: data);
    } else {
      var errMessage = jsonResponse[ResponseKeys.kMessage];
      return HttpResponse(
          isSuccess: isSuccess, message: errMessage, data: data);
    }
  }

  /// dio get request
  Future<HttpResponse> getRequest(String appUrl,
      {Map<String, dynamic>? params, String? urlParam}) async {
    if (!Reachability().isInterNetAvailable()) {
      return HttpResponse(isSuccess: false, message: AppString.noInternet);
    }

    lastRequestToken = CancelToken();

    try {
      final response =
          await dio.get(appUrl, cancelToken: lastRequestToken, data: params);
      return _handleNetworkSuccess(response: response);
    } on DioException catch (error) {
      final result = await _handleDioNetworkError(error, appUrl);

      return result;
    }
  }

  /// dio post request
  Future<HttpResponse> postRequest(String appUrl,
      {Map<String, dynamic>? params,
      FormData? formData,
      bool isFormData = false}) async {
    if (!Reachability().isInterNetAvailable()) {
      return HttpResponse(isSuccess: false, message: AppString.noInternet);
    }

    lastRequestToken = CancelToken();
    try {
      final response = await dio.post(appUrl,
          cancelToken: lastRequestToken,
          data: isFormData ? formData : params,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${PrefUtils.getAuthToken()}",
          }));

      return _handleNetworkSuccess(response: response);
    } on DioException catch (error) {
      final result = await _handleDioNetworkError(error, appUrl);

      return result;
    }
  }

  /// dio delete request
  Future<HttpResponse> deleteRequest(String appUrl,
      {Map<String, dynamic>? params, String? urlParam}) async {
    if (!Reachability().isInterNetAvailable()) {
      return HttpResponse(isSuccess: false, message: AppString.noInternet);
    }

    lastRequestToken = CancelToken();
    try {
      final response =
          await dio.delete(appUrl, cancelToken: lastRequestToken, data: params);
      return _handleNetworkSuccess(response: response);
    } on DioException catch (error) {
      final result = await _handleDioNetworkError(error, appUrl);

      return result;
    }
  }

  /// dio put request
  Future<HttpResponse> putRequest(
    String appUrl, {
    Map<String, dynamic>? params,
  }) async {
    if (!Reachability().isInterNetAvailable()) {
      return HttpResponse(isSuccess: false, message: AppString.noInternet);
    }

    lastRequestToken = CancelToken();
    try {
      final response =
          await dio.put(appUrl, cancelToken: lastRequestToken, data: params);
      return _handleNetworkSuccess(response: response);
    } on DioException catch (error) {
      final result = await _handleDioNetworkError(error, appUrl);

      return result;
    }
  }

  /// Login API
  Future<HttpResponse> callLoginApi(LoginRequest params) async {
    final HttpResponse response =
        await postRequest(AppUrl.login, params: params.toJson());
    return response;
  }

  /// Login API
  Future<HttpResponse> callSupportApi(SupportRequest params) async {
    final HttpResponse response =
        await postRequest(AppUrl.supportTicket, params: params.toJson());
    return response;
  }

  /// Ticket Details API
  Future<HttpResponse> callTicketDetailsApi(TicketDetailsRequest params) async {
    final HttpResponse response =
        await postRequest(AppUrl.ticketDetails, params: params.toJson());
    return response;
  }

  /// Submit Reply API
  Future<HttpResponse> callSubmitReplyApi(FormData params) async {
    printFormData(params);
    final HttpResponse response = await postRequest(AppUrl.submitReply,
        formData: params, isFormData: true);
    return response;
  }

  void printFormData(FormData formData) {
    // Print text fields
    for (var field in formData.fields) {
      print('Field Key: ${field.key}, Field Value: ${field.value}');
    }

    // Print files
    for (var file in formData.files) {
      print('File Key: ${file.key}, File Value: ${file.value}');
    }
  }
}
