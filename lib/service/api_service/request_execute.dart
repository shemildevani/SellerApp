import 'package:dio/dio.dart';
import 'package:seller_app/service/api_service/exception/exception.dart';
import 'package:seller_app/service/api_service/request.dart';

class RequestExecutor {
  late final Dio _dio;
  late final Request _request;

  RequestExecutor({required Dio dio, required Request request}) {
    _dio = dio;
    _request = request;
  }

  Future<Response<dynamic>> execute() async {
    try {
      Response<dynamic> response;

      response = await _dio.request(
        _request.path,
        data: _request.data,
        options: Options(
          method: _request.method?.name,
          headers: _request.headers,
        ),
      );
      return response;
    } on DioException catch (e) {
      final Response<dynamic>? response = e.response;
      if (response != null) {
        return response;
      } else {
        throw OkHttpClientException(e.error.toString());
      }
    } catch (e) {
      throw OkHttpClientException(e.toString());
    }
  }
}
