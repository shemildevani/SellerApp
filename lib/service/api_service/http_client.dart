import 'package:dio/dio.dart';
import 'package:seller_app/service/api_service/request.dart';
import 'package:seller_app/service/api_service/request_execute.dart';


abstract class HttpClient {
  static HttpClient builder() => _HttpClientBuilder._();

  HttpClient setOptions(BaseOptions options);

  HttpClient addInterceptor(Interceptor? interceptor);

  HttpClient addAllInterceptors(Iterable<Interceptor> interceptors);

  RequestExecutor newCall(Request request);
}

class _HttpClientBuilder extends _DioClient implements HttpClient {
  _HttpClientBuilder._();

  @override
  HttpClient setOptions(BaseOptions options) {
    _dio.options = options;
    return this;
  }

  @override
  HttpClient addInterceptor(Interceptor? interceptor) {
    if (interceptor != null) {
      _dio.interceptors.add(interceptor);
    } else {
      _dio.interceptors.clear();
    }
    return this;
  }

  @override
  HttpClient addAllInterceptors(Iterable<Interceptor> interceptors) {
    if (interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    } else {
      _dio.interceptors.clear();
    }
    return this;
  }

  @override
  RequestExecutor newCall(Request request) {
    return RequestExecutor(dio: _dio, request: request);
  }
}

class _DioClient {
  final Dio _dio = Dio();
}
