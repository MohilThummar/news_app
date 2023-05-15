import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../res/constant/app_strings.dart';
import '../../res/constant/constant.dart';
import '../../utils/color_print.dart';
import '../../utils/utils.dart';

class HttpUtil {
  factory HttpUtil() => _instance();

  static HttpUtil _instance() => HttpUtil._internal();

  Dio? dio;
  CancelToken cancelToken = CancelToken();

  HttpUtil._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constant.baseUrl,
        connectTimeout: const Duration(seconds: 6),
        receiveTimeout: const Duration(seconds: 6),
        contentType: 'application/json; charset=utf-8',
        responseType: ResponseType.json,
      ),
    );

    dio!.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          onError(createErrorEntity(e));
          return handler.next(e); //continue
        },
      ),
    ]);
  }

  /// On Error....
  void onError(ErrorEntity eInfo) {
    printError("error.code -> ${eInfo.code}, error.message -> ${eInfo.message}");
    if (eInfo.message.isNotEmpty) {
      Utils.showSnackBar(message: eInfo.message);
    }
  }

  /// Network and Server Error ....
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return ErrorEntity(code: 01, message: 'Connection timeout.');
      case DioErrorType.sendTimeout:
        return ErrorEntity(code: 02, message: 'Request send timeout.');
      case DioErrorType.receiveTimeout:
        return ErrorEntity(code: 03, message: 'Receiving timeout occurred.');
      case DioErrorType.cancel:
        return ErrorEntity(code: 04, message: 'Request to the server was cancelled.');
      case DioErrorType.connectionError:
        return ErrorEntity(code: 05, message: error.message!);
      case DioErrorType.badResponse:
        return handleStatusCode(error.response!.statusCode);
      case DioErrorType.unknown:
        if (error.message!.contains('SocketException')) {
          return ErrorEntity(code: 06, message: AppStrings.noInternetAvailable);
        }
        return ErrorEntity(code: 07, message: "Unexpected error occurred.");
      default:
        return ErrorEntity(code: 00, message: "Something went wrong");
    }
  }

  /// Api Error ....
  ErrorEntity handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return ErrorEntity(code: statusCode!, message: 'Bad request.');
      case 401:
        return ErrorEntity(code: statusCode!, message: 'Authentication failed.');
      case 403:
        return ErrorEntity(code: statusCode!, message: 'The authenticated user is not allowed to access the specified API endpoint.');
      case 404:
        return ErrorEntity(code: statusCode!, message: 'The requested resource does not exist.');
      case 405:
        return ErrorEntity(code: statusCode!, message: 'Method not allowed. Please check the Allow header for the allowed HTTP methods.');
      case 415:
        return ErrorEntity(code: statusCode!, message: 'Unsupported media type. The requested content type or version number is invalid.');
      case 422:
        return ErrorEntity(code: statusCode!, message: 'Data validation failed.');
      case 429:
        return ErrorEntity(code: statusCode!, message: 'Too many requests.');
      case 500:
        return ErrorEntity(code: statusCode!, message: 'Internal server error.');
      case 502:
        return ErrorEntity(code: statusCode!, message: "Invalid request");
      case 503:
        return ErrorEntity(code: statusCode!, message: "Server hangs");
      case 505:
        return ErrorEntity(code: statusCode!, message: "HTTP protocol requests are not supported");
      default:
        return ErrorEntity(code: 00, message: 'Oops something went wrong!');
    }
  }

  void cancelRequests() {
    cancelToken.cancel("cancelled");
  }

  /// restful get
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool noCache = true,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= {};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });

    var response = await dio!.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post
  Future post(
    String path, {
    dynamic data,
    bool? isFromData = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio!.post(
      path,
      data: isFromData! ? data : json.encode(data),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful put
  Future put(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio!.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful delete
  Future delete(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio!.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful patch
  Future patch(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio!.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post form
  Future postForm(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio!.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post Stream
  Future postStream(
    String path, {
    dynamic data,
    int dataLength = 0,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    var response = await dio!.post(
      path,
      data: Stream.fromIterable(data.map((e) => [e])),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = 00;
  String message = "";

  ErrorEntity({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
