import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';

class Api {
  static Dio? _dio;
  static Dio get dio {
    _dio ??= Dio(BaseOptions(baseUrl: "/"));
    dio.transformer = DioTransformer(); // replace dio default transformer
    dio.interceptors.add(InterceptorsWrapper(onRequest: ((options, handler) {
      handler.next(options);
    })));
    return _dio!;
  }
  static var get = _dio!.get;
  static var post = _dio!.post;
  static var put = _dio!.put;
  static var delete = _dio!.delete;
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
