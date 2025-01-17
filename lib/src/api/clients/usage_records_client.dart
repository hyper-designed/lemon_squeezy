import 'package:chopper/chopper.dart';

import '../../model/models.dart';
import '../endpoints/endpoints.dart';
import '../lemon_squeezy_error.dart';

final class UsageRecordsClient {
  final UsageRecordsApi api;

  UsageRecordsClient(this.api);

  Future<Resource<UsageRecord>> getUsageRecord(String id, {Include? include}) async {
    final response = await api.getUsageRecord(id, include?.toQueryParam());
    if (response.body != null && response.isSuccessful) {
      return Resource<UsageRecord>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<UsageRecordList> getAllUsageRecords({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) async {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    final response = await api.getAllUsageRecords(queryParams);
    if (response.body != null && response.isSuccessful) {
      return UsageRecordList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<List<UsageRecord>> getFilteredUsageRecords({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    final response = await api.getAllUsageRecords(queryParams);
    if (!response.isSuccessful) {
      throw LemonSqueezyApiError.fromJson(response.body!);
    }

    final List<UsageRecord> records = UsageRecordList.fromJson(response.body!).data;

    if (startDate != null) {
      records.removeWhere((record) => record.createdAt.isBefore(startDate));
    }
    if (endDate != null) {
      records.removeWhere((record) => !record.createdAt.isBefore(endDate));
    }

    return records;
  }

  Future<Resource<UsageRecord>> createUsageRecord(UsageRecordCreate create) async {
    final response = await api.createUsageRecord(create.toJson());
    if (response.body != null && response.isSuccessful) {
      return Resource<UsageRecord>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }
} 