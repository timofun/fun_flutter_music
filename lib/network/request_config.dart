
import 'package:dio/dio.dart';

const int connectTimeout = 1000 * 5;
const int receiveTimeout = 1000 * 10;
const String baseUrl = "https://api.mtnhao.com/";
const ResponseType responseType = ResponseType.json;
const String contentType = Headers.jsonContentType;
String fileUrl = '';
