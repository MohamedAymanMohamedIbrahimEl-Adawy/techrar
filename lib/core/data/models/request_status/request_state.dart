import '../../enums/request_status.dart';

class RequestState {
  final String? message;
  final RequestStatus requestStatus;
  RequestState({
    this.message,
    required this.requestStatus,
  });

  @override
  String toString() =>
      'RequestState(message: $message, requestStatus: $requestStatus)';
}
