
import '../../../data/network/network.dart';
import '../repository.dart';

extension DynamicExt on DynamicDto {
  DynamicModel toModel() {
    return DynamicModel(
      products?.map((e) => e.toProduct()).toList() ?? [],
      total ?? 0,
      skip ?? 0,
      limit ?? 0,
    );
  }
}

extension ProductExt on ProductDto {
  ProductModel toProduct() {
    return ProductModel(
      id ?? 0,
      title ?? '',
      description ?? '',
      price ?? 0,
      discountPercentage ?? 0,
      rating ?? 0,
      stock ?? 0,
      brand ?? '',
      category ?? '',
      thumbnail ?? '',
      images ?? [],
    );
  }
}
