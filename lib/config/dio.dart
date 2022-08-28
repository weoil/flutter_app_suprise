import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';

class Api {
  static Dio? _dio;
  static Dio get dio {
    if (_dio != null) {
      return _dio as Dio;
    }
    _dio = Dio(BaseOptions(baseUrl: "/"));
    dio.transformer = DioTransformer(); // replace dio default transformer
    dio.interceptors.add(InterceptorsWrapper(onRequest: ((options, handler) {
      handler.next(options);
    })));
    return _dio!;
  }

  static var get = dio.get;
  static var post = dio.post;
  static var put = dio.put;
  static var delete = dio.delete;
}

class DioTransformer extends DefaultTransformer {
  // Must be top-level function
  static _parseAndDecode(String response) {
    return convert.jsonDecode(response);
  }

  static _parseJson(String text) {
    return compute(_parseAndDecode, text);
  }

  DioTransformer() : super(jsonDecodeCallback: _parseJson);
}
