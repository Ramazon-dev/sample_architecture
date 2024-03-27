import 'package:json_annotation/json_annotation.dart';

part 'dynamic_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class DynamicDto {
  @JsonKey(name: 'products')
  final List<ProductDto>? products;
  @JsonKey(name: 'total')
  final int? total;
  @JsonKey(name: 'skip')
  final int? skip;
  @JsonKey(name: 'limit')
  final int? limit;

  DynamicDto({this.products, this.total, this.skip, this.limit});

  factory DynamicDto.fromJson(Map<String, dynamic> json) =>
      _$DynamicDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DynamicDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ProductDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'discountPercentage')
  final double? discountPercentage;
  @JsonKey(name: 'rating')
  final double? rating;
  @JsonKey(name: 'stock')
  final int? stock;
  @JsonKey(name: 'brand')
  final String? brand;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'thumbnail')
  final String? thumbnail;
  @JsonKey(name: 'images')
  final List<String>? images;

  ProductDto({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
