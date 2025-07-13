import 'package:get_it/get_it.dart';
import 'package:techrar/core/services/network/dio_client.dart';

final GetIt serviceLocator = GetIt.instance;
Future<void> initServices() async {
  // Register netowork client
  serviceLocator.registerSingleton<DioClient>(DioClient());
}
