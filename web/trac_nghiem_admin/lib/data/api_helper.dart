
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:path/path.dart' as paths;

import 'app_respone.dart';
class HttpRequest {
  static final HttpRequest instance = HttpRequest._();
  int _timeOut = 5000; //5 s
  Dio _dio;
  DioCacheManager _dioCacheManager;
  Options _options;

  DioCacheManager get dioCacheManager {
    _dioCacheManager ??= DioCacheManager(CacheConfig(
        baseUrl: baseUrl,
        skipMemoryCache: true,
        skipDiskCache: true));
    return _dioCacheManager;
  }

  HttpRequest._() {
    BaseOptions options = BaseOptions(
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        baseUrl: baseUrl,
        contentType: ContentType.json.value,
        responseType: ResponseType.plain);
    String auth = 'Basic ' +
        base64Encode(utf8
            .encode('$autherUserName:$autherUserName'));
    options.headers.addAll(<String, dynamic>{"Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": true,
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });
//    options.contentType=Headers.jsonContentType;
    _dio = Dio(options);
//    _dio.interceptors
//        .add(LogInterceptor(requestBody: true, responseBody: true));
    _dio.interceptors.add(dioCacheManager.interceptor);
  }

//  static Future<HttpRequest> getInstance() async {
//    if (instance == null) {
//      instance = HttpRequest._();
//      return instance;
//    } else
//      return instance;
//  }

  Future<String> getAsync(String url, {Map<String, dynamic> headers}) async {
    try {
      _options =
          buildCacheOptions(Duration(days: 7), maxStale: Duration(days: 10));
      if (headers != null) _options.headers.addAll(headers);
      Response response = await _dio.get(url, options: _options);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
//      AppCenter.trackEventAsync(
//          'getAsync', <String, String>{'url': url, 'catch': e.toString()});
      return null;
    }
  }

  Future<String> postAsync(String url, Map<String, dynamic> param,
      {Map<String, dynamic> headers}) async {

    try {
//      _options =
//          buildCacheOptions(Duration(days: 7), maxStale: Duration(days: 10));
      if (headers != null) _options.headers.addAll(headers);
      String jso = jsonEncode(param);
      Response response = await _dio.post(url, data: jso);
      if (response.statusCode == 200) {
        //      String json = Utf8Decoder().convert(response.bodyBytes);
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
//      AppCenter.trackEventAsync(
//          'postAsync', <String, String>{'url': url, 'catch': e.toString()});
      return null;
    }
  }

  Future<String> postCustomAsync(String url, List<Map<String, dynamic>> param,
      {Map<String, dynamic> headers}) async {

    try {
//      _options =
//          buildCacheOptions(Duration(days: 7), maxStale: Duration(days: 10));
      if (headers != null) _options.headers.addAll(headers);
      String jso = jsonEncode(param);
      Response response = await _dio.post(url, data: jso);
      if (response.statusCode == 200) {
        //      String json = Utf8Decoder().convert(response.bodyBytes);
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
//      AppCenter.trackEventAsync(
//          'postAsync', <String, String>{'url': url, 'catch': e.toString()});
      return null;
    }
  }


  Future<String> postUploadFile(String url,
      {List<File> files, File file}) async {
    try {
      var formData = FormData();
      if (files != null) {
        files?.forEach((element) {
          formData.files.addAll([
            MapEntry(
              "files",
              MultipartFile.fromBytes(element.readAsBytesSync(),
                  filename: paths.basename(element.path)),
            )
          ]);
        });
      } else {
        formData.files.addAll([
          MapEntry(
            "files",
            MultipartFile.fromBytes(file.readAsBytesSync(),
                filename: paths.basename(file.path)),
          )
        ]);
      }

      //List<Asset> lstImage,
//      else if (lstImage?.length > 0) {
//        lstImage.forEach((element) async {
//          ByteData byteData = await element.getByteData();
//          List<int> imageData = byteData.buffer.asUint8List();
//
//          formData.files.addAll([
//            MapEntry(
//              "files",
//              MultipartFile.fromBytes(imageData,
//                  filename: paths.basename(element.name)),
//            )
//          ]);
//        });
//      }

      Response response = await _dio.post(
        url,
        data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent $total");
        },
      );
      if (response.statusCode == 200) return response.data;
      return null;
    } catch (e) {
      return null;
    }
  }
}