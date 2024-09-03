// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usage_records_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$UsageRecordsApi extends UsageRecordsApi {
  _$UsageRecordsApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = UsageRecordsApi;

  @override
  Future<Response<Map<String, dynamic>>> getUsageRecord(
    String priceId, [
    Map<String, dynamic>? params,
  ]) {
    final Uri $url = Uri.parse('/usage-records/${priceId}');
    final Map<String, dynamic> $params = params ?? const {};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getAllUsageRecords(
      [Map<String, dynamic>? params]) {
    final Uri $url = Uri.parse('/usage-records');
    final Map<String, dynamic> $params = params ?? const {};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> createUsageRecord(
      Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/usage-records');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
