import 'package:json_annotation/json_annotation.dart';

part 'cbu_rate.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CbuRate {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'Code')
  final String? code;
  @JsonKey(name: 'Ccy')
  final String? ccy;
  @JsonKey(name: 'CcyNm_RU')
  final String? ccyNm_RU;
  @JsonKey(name: 'CcyNm_UZ')
  final String? ccyNm_UZ;
  @JsonKey(name: 'CcyNm_UZC')
  final String? ccyNm_UZC;
  @JsonKey(name: 'CcyNm_EN')
  final String? ccyNm_EN;
  @JsonKey(name: 'Nominal')
  final String? nominal;
  @JsonKey(name: 'Rate')
  final String? rate;
  @JsonKey(name: 'Diff')
  final String? diff;
  @JsonKey(name: 'Date')
  final String? date;

  CbuRate({
    this.id,
    this.code,
    this.ccy,
    this.ccyNm_RU,
    this.ccyNm_UZ,
    this.ccyNm_UZC,
    this.ccyNm_EN,
    this.nominal,
    this.rate,
    this.diff,
    this.date,
  });

  factory CbuRate.fromJson(Map<String, dynamic> json) =>
      _$CbuRateFromJson(json);

  Map<String, dynamic> toJson() => _$CbuRateToJson(this);
}
