// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'rating', 'city', 'address'],
  );
  return Shop(
    json['id'] as int,
    json['name'] as String,
    json['rating'] as int,
    json['city'] as String,
    json['address'] as String,
    json['info'] == null
        ? null
        : ShopInfo.fromJson(json['info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'city': instance.city,
      'address': instance.address,
      'info': instance.info,
    };

ShopInfo _$ShopInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['description', 'hollidays', 'services'],
  );
  return ShopInfo(
    json['description'] as String,
    HollidayInfo.fromJson(json['hollidays'] as Map<String, dynamic>),
    (json['services'] as List<dynamic>)
        .map((e) => Service.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShopInfoToJson(ShopInfo instance) => <String, dynamic>{
      'description': instance.description,
      'hollidays': instance.hollidays,
      'services': instance.services,
    };

HollidayInfo _$HollidayInfoFromJson(Map<String, dynamic> json) =>
    HollidayInfo();

Map<String, dynamic> _$HollidayInfoToJson(HollidayInfo instance) =>
    <String, dynamic>{};
