import 'package:chopper/chopper.dart';

import '../../utils.dart';

part 'usage_records_api.chopper.dart';

@ChopperApi()
abstract class UsageRecordsApi extends ChopperService {
  UsageRecordsApi();

  factory UsageRecordsApi.create([ChopperClient? client]) =>
      _$UsageRecordsApi(client);

  @GET(path: '/usage-records/{id}')
  Future<Response<JsonMap>> getUsageRecord(@Path('id') String priceId,
      [@QueryMap() Map<String, dynamic>? params]);

  @GET(path: '/usage-records')
  Future<Response<JsonMap>> getAllUsageRecords(
      [@QueryMap() Map<String, dynamic>? params]);

  @POST(path: '/usage-records')
  Future<Response<JsonMap>> createUsageRecord(
      @Body() Map<String, dynamic> body);
}
