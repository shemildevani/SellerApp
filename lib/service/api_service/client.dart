import 'package:dio/dio.dart';
import 'package:seller_app/config/app_constant/app_string.dart';
import 'package:seller_app/service/api_service/base_response.dart';
import 'package:seller_app/service/api_service/connectivity/connectivity.dart';
import 'package:seller_app/service/api_service/exception/exception.dart';
import 'package:seller_app/service/api_service/http_client.dart';
import 'package:seller_app/service/api_service/request.dart';

class EventClient {
  final HttpClient _client = HttpClient.builder().setOptions(
    BaseOptions(baseUrl: ''),
  );

  Future<Results<BaseResponse<dynamic>, String>> handleRequest(
    Request request,
  ) async {
    try {
      if (await ConnectivityUtils.isConnected) {
        final Response<dynamic> response =
            await _client.newCall(request).execute();
        if (response.statusCode == 200 || response.statusCode == 201) {
          final BaseResponse baseResponse = BaseResponse.fromResponse(
            response.data,
          );
          if (!baseResponse.success) {
            return Failure(baseResponse.message.toString());
          }
          return Success(baseResponse);
        } else if (response.statusCode == 401) {
          return Failure(StringConst.somethingWentWrong);
        } else if (response.statusCode == 400 || response.statusCode == 404) {
          final BaseResponse baseResponse = BaseResponse.fromResponse(
            response.data,
          );
          return Failure(baseResponse.message ?? '');
        } else {
          return Failure(StringConst.somethingWentWrong);
        }
      } else {
        return Failure(StringConst.noInterNetConnection);
      }
    } on OkHttpClientException catch (_) {
      return Failure(StringConst.httpClientError);
    } on Exception catch (_) {
      return Failure(StringConst.httpClientCatchError);
    }
  }
}

abstract class Results<S, F> {
  T when<T>(T Function(S value) ifSuccess, T Function(F error) ifFailure);
}

class Success<S, F> extends Results<S, F> {
  final S _value;

  Success(this._value);

  S get value => _value;

  @override
  T when<T>(T Function(S s) ifSuccess, T Function(F f) ifFailure) =>
      ifSuccess(_value);
}

class Failure<S, F> extends Results<S, F> {
  final F _value;

  Failure(this._value);

  F get value => _value;

  @override
  T when<T>(T Function(S s) ifSuccess, T Function(F f) ifFailure) =>
      ifFailure(_value);
}
