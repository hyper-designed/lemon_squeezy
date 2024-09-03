import 'dart:async';

import 'package:chopper/chopper.dart';

class LemonSqueezyEssentialHeadersInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    final request = chain.request.copyWith(headers: {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
    });
    return chain.proceed(request);
  }
}

class LemonSqueezyAuthHeadersInterceptor implements Interceptor {
  final String apiKey;
  LemonSqueezyAuthHeadersInterceptor({required this.apiKey});

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    final request = chain.request.copyWith(headers: <String, String>{
      'Authorization': 'Bearer $apiKey',
    });
    return chain.proceed(request);
  }
}
