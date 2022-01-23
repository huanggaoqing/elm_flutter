// ignore_for_file: unnecessary_new, unnecessary_this, unnecessary_null_comparison, avoid_init_to_null, prefer_conditional_assignment, unused_field, prefer_typing_uninitialized_variables, prefer_final_fields, avoid_print

import "package:dio/dio.dart";

class Request {
  late Dio dio;
  static Request _interface = Request._internal();
  Request._internal(){
    this.dio = this._getHttp();
  }
  factory Request() => _interface;

  Dio _getHttp() {
    Dio http = new Dio(
      BaseOptions(
        baseUrl: "https://elm.cangdu.org",
        connectTimeout: 5000,
        sendTimeout: 5000,
        receiveTimeout: 5000,
      ),
    );
    http.interceptors.add(InterceptorsWrapper(
      onError: _onError,
      onRequest: _onRequest,
      onResponse: _onResponse,
    ));
    return http;
  }

  // 请求错误拦截
  void _onError(
    DioError e,
    ErrorInterceptorHandler handler,
  ) {}

  // 请求拦截
  void _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    handler.next(options);
  }

  // 响应拦截
  void _onResponse(
    Response e,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(e);
  }
}
