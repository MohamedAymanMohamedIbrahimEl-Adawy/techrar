import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:techrar/core/data/constants/api_constants.dart';
import 'package:techrar/core/services/network/api_response_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'network_interface.dart';

class DioClient extends NetworkClientInterface {
  final String? baseUrl;

  // final SharedPreferences sharedPreferences;

  Dio? dio;
  String? token;
  String? countryCode;

  DioClient({this.baseUrl}) {
    // token = sharedPreferences.getString(AppConstants.userLoginTokenKey);
    // countryCode = sharedPreferences.getString(AppConstants.countryCodeKey);

    if (kDebugMode) {
      print("Token --> $token");
    }

    dio = Dio();
    dio
      ?..options.baseUrl = baseUrl ?? ApiConstants.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        // AppConstants.languageCodeKey:
        //     countryCode == 'US' ? 'en' : 'en', //countryCode!.toLowerCase(),
      };

    // customization
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
    print("Confied dio ........");
  }

  void updateHeader(String? token, String? countryCode) {
    token = token ?? this.token;
    countryCode =
        countryCode == null
            ? this.countryCode == 'US'
                ? 'en'
                : this.countryCode!.toLowerCase()
            : countryCode == 'US'
            ? 'en'
            : countryCode.toLowerCase();
    this.token = token;
    this.countryCode = countryCode;
    dio!.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $token',
      // AppConstants.languageCodeKey:
      //     countryCode == 'US' ? 'en' : countryCode.toLowerCase(),
    };
  }

  @override
  Future<ApiResponseModel> get({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio!.get(
        endPoint,
        data: body,
        queryParameters: queryParameters,
      );
      return ApiResponseModel(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel> post({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio!.post(
        endPoint,
        data: body,
        queryParameters: queryParameters,
      );
      return ApiResponseModel(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel> put({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio!.put(
        endPoint,
        data: body,
        queryParameters: queryParameters,
      );
      return ApiResponseModel(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel> delete({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio!.delete(
        endPoint,
        data: body,
        queryParameters: queryParameters,
      );
      return ApiResponseModel(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
