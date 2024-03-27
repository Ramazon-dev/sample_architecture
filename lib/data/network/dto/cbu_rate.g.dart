// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cbu_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CbuRate _$CbuRateFromJson(Map<String, dynamic> json) => CbuRate(
      id: json['id'] as int?,
      code: json['Code'] as String?,
      ccy: json['Ccy'] as String?,
      ccyNm_RU: json['CcyNm_RU'] as String?,
      ccyNm_UZ: json['CcyNm_UZ'] as String?,
      ccyNm_UZC: json['CcyNm_UZC'] as String?,
      ccyNm_EN: json['CcyNm_EN'] as String?,
      nominal: json['Nominal'] as String?,
      rate: json['Rate'] as String?,
      diff: json['Diff'] as String?,
      date: json['Date'] as String?,
    );

Map<String, dynamic> _$CbuRateToJson(CbuRate instance) => <String, dynamic>{
      'id': instance.id,
      'Code': instance.code,
      'Ccy': instance.ccy,
      'CcyNm_RU': instance.ccyNm_RU,
      'CcyNm_UZ': instance.ccyNm_UZ,
      'CcyNm_UZC': instance.ccyNm_UZC,
      'CcyNm_EN': instance.ccyNm_EN,
      'Nominal': instance.nominal,
      'Rate': instance.rate,
      'Diff': instance.diff,
      'Date': instance.date,
    };
