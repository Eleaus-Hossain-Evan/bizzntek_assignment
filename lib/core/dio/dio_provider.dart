import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core.dart';

part 'dio_provider.g.dart';

String kIsTokenRequired = 'isTokenRequired';
String kAuthorization = 'Authorization';
final kBearer = 'Bearer';
final kRetryCount = 'RetryCount';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  // final tokenRepo = ref.watch(tokenRepoRepoProvider);

  final options = BaseOptions(
    baseUrl: ApiEndpoint.baseUrl,
    responseType: ResponseType.json,
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
    sendTimeout: const Duration(minutes: 1),
    headers: {
      "contentType": Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
      kIsTokenRequired: true,
    },
  );
  final dio = Dio(options);

  dio.interceptors.addAll([
    // AuthInterceptor(
    //   dio: dio,
    //   tokenRepository: ref.watch(tokenRepoRepoProvider),
    //   ref: ref,
    // ),
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (options.headers[kIsTokenRequired] == false) {
          print('══ ✖️✖️ Refresh Token [${options.path}] Not required ✖️✖️ ══');
          // if the request doesn't need token,
          // then just continue to the next interceptor
          options.headers.remove(kIsTokenRequired); //remove the auxiliary header
          options.headers.remove(kAuthorization); //remove the auxiliary header
          handler.next(options);
        } else {
          // final shouldRefresh = tokenRepo.shouldRefresh();
          // final refreshToken = tokenRepo.getRefreshToken();

          // PERFORM REFRESH TOKEN IF REQUIRED
          // if (shouldRefresh && refreshToken != null) {
          //   await _refreshAccessToken(ref, tokenRepo, options);
          // }

          // final token = tokenRepo.getAccessToken();
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }

          return handler.next(options);
        }
      },
      onError: (error, handler) async {
        print('''
 
===================== ⚠️⚠️ ERROR ⚠️⚠️ =====================
  URI -> ${error.requestOptions.method}||${error.requestOptions.uri}
  QUERYPARAMS -> ${error.requestOptions.queryParameters}
  HEADER -> ${error.requestOptions.headers}
  DATA -> ${error.requestOptions.data}
===================== ⚠️⚠️ ERROR ⚠️⚠️ =====================

        ''');
        if (error.response?.statusCode == 401) {
          log('401 Unauthorized', name: 'Dio', error: error);
          // await tokenRepo.removeTokens();
          // await _refreshAccessToken(ref, tokenRepo, error.requestOptions).then(
          //   (value) {
          //     if (value != null) {
          //       error.requestOptions.headers['Authorization'] = 'Bearer $value';
          //       dio.fetch(error.requestOptions).then(
          //         (value) {
          //           handler.resolve(value);
          //         },
          //       );
          //     } else {
          //       handler.reject(error);
          //     }
          //   },
          // );
          handler.next(error);
        } else if (error.response?.statusCode == 404) {
          log('404 Not Found', name: 'Dio', error: error);
          // await tokenRepo.removeTokens();
          handler.next(error);
        } else if (error.response?.statusCode == 498) {
          log('498 Token expired', name: 'Dio', error: error);
          // final token = await _refreshAccessToken(ref, tokenRepo, error.requestOptions);
          // if (token != null) {
          //   error.requestOptions.headers['Authorization'] = 'Bearer $token';
          //   dio.fetch(error.requestOptions).then(
          //     (value) {
          //       handler.resolve(value);
          //     },
          //   );
          // } else {
          //   handler.reject(error);
          // }
          // handler.reject(error);
        } else {
          handler.next(error);
        }
      },
    ),
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ),
  ]);

  dio.httpClientAdapter = NativeAdapter();

  return dio;
}
