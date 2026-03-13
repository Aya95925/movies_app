import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_new/core/constant/app_constant.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GitItModule {
  Connectivity createConnectivity() => Connectivity();
  @singleton
  Dio createDio() {
    Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));
    dio.interceptors.add(PrettyDioLogger());

    return dio;
  }
}
