import '../../model/models.dart';
import '../endpoints/endpoints.dart';
import '../lemon_squeezy_error.dart';

final class ProductsClient {
  final ProductsApi api;
  final ProductVariantsClient variants;

  ProductsClient(this.api, this.variants);

  Future<Resource<Product>> getProduct(String id, {Include? include}) async {
    final response = await api.getProduct(id, include?.toQueryParam());
    if (!response.isSuccessful) {
      throw LemonSqueezyApiError.fromJson(response.body!);
    }
    final Resource<Product> resource =
        Resource<Product>.fromJson(response.body!);
    if (include?.variants == true && resource.included.isNotEmpty) {
      final List<ProductVariant> variants = [];
      for (final ResourceData data in resource.included) {
        if (data is ProductVariant) {
          variants.add(data);
        }
      }
      return resource.copyWith(
          data: resource.data.copyWith(variants: variants));
    }
    return resource;
  }

  Future<ProductList> getAllProducts({
    Include? include,
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
  }) async {
    final Map<String, dynamic> queryParams = {
      ...?include?.toQueryParam(),
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
    };
    final response = await api.getAllProducts(queryParams);
    if (!response.isSuccessful) {
      throw LemonSqueezyApiError.fromJson(response.body!);
    }
    ProductList productList = ProductList.fromJson(response.body!);

    // Fetch price models and link them with their variants
    if (include?.variants == true) {
      final List<Product> products = [];
      for (final Product product in productList.data) {
        try {
          final ProductVariantList variantList = await getProductVariants(
              product.id,
              include: Include.priceModel());
          products.add(product.copyWith(variants: variantList.data));
        } catch (e) {
          products.add(product);
        }
      }
      return productList.copyWith(data: products);
    }

    return productList;
  }

  Future<ProductVariantList> getProductVariants(String id,
      {Include? include}) async {
    final response = await api.getProductVariants(id, include?.toQueryParam());
    if (response.body != null && response.isSuccessful) {
      return ProductVariantList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }
}

class ProductVariantsClient {
  final ProductVariantsApi api;

  ProductVariantsClient(this.api);

  Future<Resource<ProductVariant>> getVariant(String id,
      {Include? include}) async {
    final response = await api.getVariant(id, include?.toQueryParam());
    if (response.body != null && response.isSuccessful) {
      return Resource<ProductVariant>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<ProductVariantList> getAllVariants({
    Include? include,
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
  }) async {
    final Map<String, dynamic> queryParams = {
      ...?include?.toQueryParam(),
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
    };
    final response = await api.getAllVariants(queryParams);
    if (response.body != null && response.isSuccessful) {
      return ProductVariantList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }
}
