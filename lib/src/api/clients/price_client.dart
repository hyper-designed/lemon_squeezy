import '../../model/models.dart';
import '../endpoints/endpoints.dart';

final class PriceClient {
  final PriceApi api;

  PriceClient(this.api);

  Future<Resource<Price>> getPrice(
    String priceId, {
    Include? include,
  }) async {
    final response = await api.getPrice(priceId, include?.toQueryParam());
    if (response.body != null && response.isSuccessful) {
      return Resource<Price>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<PriceList> getAllPrices({
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
    final response = await api.getAllPrices(queryParams);
    if (response.isSuccessful) {
      return PriceList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }
}
