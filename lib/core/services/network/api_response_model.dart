// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApiResponseModel {
  final dynamic data;
  final int? statusCode;
  final String? statusMessage;
  ApiResponseModel({required this.data, this.statusCode, this.statusMessage});

  ApiResponseModel copyWith({
    dynamic data,
    int? statusCode,
    String? statusMessage,
  }) {
    return ApiResponseModel(
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'statusCode': statusCode,
      'statusMessage': statusMessage,
    };
  }

  factory ApiResponseModel.fromMap(Map<String, dynamic> map) {
    return ApiResponseModel(
      data: map['data'] as dynamic,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      statusMessage:
          map['statusMessage'] != null ? map['statusMessage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponseModel.fromJson(String source) =>
      ApiResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ApiResponseModel(data: $data, statusCode: $statusCode, statusMessage: $statusMessage)';

  @override
  bool operator ==(covariant ApiResponseModel other) {
    if (identical(this, other)) return true;

    return other.data == data &&
        other.statusCode == statusCode &&
        other.statusMessage == statusMessage;
  }

  @override
  int get hashCode =>
      data.hashCode ^ statusCode.hashCode ^ statusMessage.hashCode;
}
