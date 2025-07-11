import 'dart:io';

import 'package:seller_app/service/supported_method.dart';

class Request {
  final SupportedMethods? method;
  final String path;
  Map<String, dynamic>? headers;
  dynamic data;
  File? file;

  Request._({
    required this.path,
    this.method,
    this.headers,
    this.data,
    this.file,
  });

  Request._empty()
    : path = '',
      method = null,
      headers = null,
      data = null,
      file = null;

  Request _copyWith({
    SupportedMethods? method,
    String? path,
    Map<String, String>? headers,
    dynamic data,
    File? file,
  }) {
    return Request._(
      method: method ?? method,
      path: path ?? this.path,
      headers: headers ?? this.headers,
      data: data ?? this.data,
      file: file ?? this.file,
    );
  }

  static RequestBuilder builder() => RequestBuilder();
}

class RequestBuilder {
  Request _request = Request._empty();

  RequestBuilder post([dynamic data]) {
    _request = _request._copyWith(method: SupportedMethods.post, data: data);
    return this;
  }

  RequestBuilder get() {
    _request = _request._copyWith(method: SupportedMethods.get);
    return this;
  }

  RequestBuilder put([dynamic data]) {
    _request = _request._copyWith(method: SupportedMethods.put, data: data);
    return this;
  }

  RequestBuilder patch([dynamic data]) {
    _request = _request._copyWith(method: SupportedMethods.patch, data: data);
    return this;
  }

  RequestBuilder delete([dynamic data]) {
    _request = _request._copyWith(method: SupportedMethods.delete, data: data);
    return this;
  }

  RequestBuilder setFormData(File formData) {
    _request = _request._copyWith(file: formData);
    return this;
  }

  RequestBuilder setPath(String url) {
    _request = _request._copyWith(path: url);
    return this;
  }

  RequestBuilder addHeader(String key, String value) {
    final Map<String, String> headers = Map<String, String>.from(
      _request.headers ?? {},
    );
    headers[key] = value;
    _request = _request._copyWith(headers: headers);
    return this;
  }

  Request build() {
    assert(_request.method != null && _request.path != '');
    return _request;
  }
}
