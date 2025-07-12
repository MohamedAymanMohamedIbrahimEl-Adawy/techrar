import 'api_response_model.dart';

abstract class NetworkClientInterface {
  Future<ApiResponseModel> post({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
  Future<ApiResponseModel> put({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
  Future<ApiResponseModel> delete({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
  Future<ApiResponseModel> get({
    required String endPoint,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
}
