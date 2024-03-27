import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PaginationModel {
  @JsonKey(name: 'pagination')
  final Pagination? pagination;

  PaginationModel({this.pagination});

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Pagination {
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'total_items')
  final int? totalItems;
  @JsonKey(name: 'has_next_page')
  final bool? hasNextPage;
  @JsonKey(name: 'has_previous_page')
  final bool? hasPreviousPage;

  Pagination({
    this.totalPages,
    this.currentPage,
    this.totalItems,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
