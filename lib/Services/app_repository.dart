import 'package:dio/dio.dart';
import 'package:shubham_practical/Services/all_request.dart';
import 'package:shubham_practical/Services/api_provider.dart';

class AppRepository {
  final apiProvider = ApiProvider();

  /// Login Api
  Future<HttpResponse> callLoginApi(LoginRequest params) =>
      apiProvider.callLoginApi(params);

  /// Support Api
  Future<HttpResponse> callSupportApi(SupportRequest params) =>
      apiProvider.callSupportApi(params);

  /// Ticket Details Api
  Future<HttpResponse> callTicketDetailsApi(TicketDetailsRequest params) =>
      apiProvider.callTicketDetailsApi(params);

  /// Submit Reply Api
  Future<HttpResponse> callSubmitReplyApi(FormData params) =>
      apiProvider.callSubmitReplyApi(params);
}
