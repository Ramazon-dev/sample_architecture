// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      totalPages: json['total_pages'] as int?,
      currentPage: json['current_page'] as int?,
      totalItems: json['total_items'] as int?,
      hasNextPage: json['has_next_page'] as bool?,
      hasPreviousPage: json['has_previous_page'] as bool?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'current_page': instance.currentPage,
      'total_items': instance.totalItems,
      'has_next_page': instance.hasNextPage,
      'has_previous_page': instance.hasPreviousPage,
    };
