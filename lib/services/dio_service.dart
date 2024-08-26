import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioService extends GetxService {
  static final dio = Dio();

  DioService initDio() {
    dio.options = BaseOptions(
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    );

    return this;
  }
}
