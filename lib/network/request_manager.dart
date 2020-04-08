import 'package:dio/dio.dart';
import 'package:fun_flutter_music/network/net_code.dart';
import 'package:fun_flutter_music/network/request_config.dart';
import 'package:fun_flutter_music/network/request_interceptor.dart';
import 'package:fun_flutter_music/network/response_interceptor.dart';
import 'package:fun_flutter_music/network/result_data.dart';

///RequestManager 单例
class RequestManager {

  static RequestManager _instance = RequestManager._internal();
  Dio _dio;
  factory RequestManager() => _instance;
  BaseOptions options;
  ///通用全局单例，第一次使用时初始化
  RequestManager._internal({String baseUrl}) {
    if (null == _dio) {
      _dio=Dio();
      options=BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        responseType : responseType,
        contentType : contentType,
      );
      _dio.interceptors.add(new RequestInterceptors());
      _dio.interceptors.add(new ResponseInterceptors());
      _dio.options=options;
    }
  }
  static RequestManager getInstance({String baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }
  //用于指定特定域名，比如cdn和kline首次的http请求
  RequestManager _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio.options.baseUrl = baseUrl;
    }
    return this;
  }
  //一般请求，默认域名
  RequestManager _normal() {
    if (_dio != null) {
      if (_dio.options.baseUrl != baseUrl) {
        _dio.options.baseUrl = baseUrl;
      }
    }
    return this;
  }
  ///通用的GET请求
  get(api, {params, noTip = false}) async {
    Response response;
    try {
      response = await _dio.get(api, queryParameters: params);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data['code']);
    }
    return response.data;
  }
  ///通用的POST请求
  post(api, params, {noTip = false}) async {
    Response response;
    try {
      response = await _dio.post(api, data: params);
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data['code']);
    }
    return response.data;
  }

}

ResultData resultError(DioError e) {
  Response errorResponse;
  if (e.response != null) {
    errorResponse = e.response;
  } else {
    errorResponse = new Response(statusCode: 666);
  }
  if (e.type == DioErrorType.CONNECT_TIMEOUT ||
      e.type == DioErrorType.RECEIVE_TIMEOUT) {
    errorResponse.statusCode = Code.NETWORK_TIMEOUT;
  }
  return new ResultData(
      errorResponse.statusMessage, false, errorResponse.statusCode);
}
