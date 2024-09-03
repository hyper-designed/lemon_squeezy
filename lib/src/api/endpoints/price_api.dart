import 'package:chopper/chopper.dart';

import '../../utils.dart';

part 'price_api.chopper.dart';

@ChopperApi()
abstract class PriceApi extends ChopperService {
  PriceApi();

  factory PriceApi.create([ChopperClient? client]) => _$PriceApi(client);

  @Get(path: '/prices/{id}')
  Future<Response<JsonMap>> getPrice(@Path('id') String priceId,
      [@QueryMap() Map<String, dynamic>? params]);

  @Get(path: '/prices')
  Future<Response<JsonMap>> getAllPrices(
      [@QueryMap() Map<String, dynamic>? params]);
}
