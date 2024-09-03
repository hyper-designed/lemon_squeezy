import 'package:chopper/chopper.dart';

import '../../utils.dart';

part 'usage_records_api.chopper.dart';

@ChopperApi()
abstract class UsageRecordsApi extends ChopperService {
  UsageRecordsApi();

  factory UsageRecordsApi.create([ChopperClient? client]) =>
      _$UsageRecordsApi(client);

  @Get(path: '/usage-records/{id}')
  Future<Response<JsonMap>> getUsageRecord(@Path('id') String priceId,
      [@QueryMap() Map<String, dynamic>? params]);

  @Get(path: '/usage-records')
  Future<Response<JsonMap>> getAllUsageRecords(
      [@QueryMap() Map<String, dynamic>? params]);

  @Post(path: '/usage-records')
  Future<Response<JsonMap>> createUsageRecord(
      @Body() Map<String, dynamic> body);
}
