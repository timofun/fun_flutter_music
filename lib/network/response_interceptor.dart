import 'package:dio/dio.dart';
import 'result_data.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  static const String code_success = 'CODE_200'; //登录失效
  static const String code_overdue = 'CODE_401'; //登录失效
  static const String code_dueTo = 'CODE_301'; //到期
  static const String code_permission = 'CODE_406'; //权限更改

  @override
  onResponse(Response response) async {
    try {
      ///一般只需要处理200的情况，300、400、500保留错误信息
      if (response.statusCode >= 200 || response.statusCode < 300) {
        String code = response.data["code"];
        if (code == code_success) {
          return new ResultData(response.data, true, 200, headers: response.headers);
        } else {
          return new ResultData(response.data, false, 200, headers: response.headers);
        }
      }
    } catch (e) {
      return new ResultData(response.data, false, response.statusCode,
          headers: response.headers);
    }
    return new ResultData(response.data, false, response.statusCode,
        headers: response.headers);
  }
}
