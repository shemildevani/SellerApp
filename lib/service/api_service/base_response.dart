class BaseResponse<T> {
  final bool success;
  final String? message;
  final T? data;

  BaseResponse({this.success = false, this.message, this.data});

  factory BaseResponse.fromResponse(dynamic data) {
    return BaseResponse(
      // success: AppFormatter.boolFromJson(
      //   data,
      //   'success',
      //   additionalAttribute: 'status',
      // ),
      message: data['message'],
      data: data['data'],
    );
  }

  @override
  String toString() {
    return 'BaseResponse(status: $success, message: $message , data: $data)';
  }
}