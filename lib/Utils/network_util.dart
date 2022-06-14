import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
class NetworkUtil {
  //Next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;
  final JsonDecoder _decoder = new JsonDecoder();


  Future<dynamic> get(String url, Map<String, String> headers) {
    return http.get(Uri.parse(url), headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> getLang(String url, Map<String, String> headers) {
    return http.get(Uri.parse(url), headers: headers).then((http.Response response) {
      final String res = utf8.decode(response.bodyBytes);
      final int statusCode = response.statusCode;
      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
      }
      return _decoder.convert(res);
    });
  }



   Future<dynamic> post(String url, Map<String, String> body) {
    return http.post(Uri.parse(url), body: body).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 203 ||
          statusCode == 201 ||
          statusCode == 400 ||
          json == null) {
      }
      return _decoder.convert(res);
    });
  }


}
