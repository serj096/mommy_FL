// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['payType'],
  );
  return Order(
    json['ShopId'] as int,
    $enumDecode(_$PaymentEnumMap, json['payType']),
    json['IsCompleted'] as bool,
    DateTime.parse(json['Time'] as String),
    $enumDecode(_$PlaceEnumMap, json['Location']),
    (json['Services'] as List<dynamic>).map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'ShopId': instance.shopId,
      'payType': _$PaymentEnumMap[instance.payType]!,
      'IsCompleted': instance.isCompleted,
      'Time': instance.time.toIso8601String(),
      'Location': _$PlaceEnumMap[instance.location]!,
      'Services': instance.services,
    };

const _$PaymentEnumMap = {
  Payment.cash: 'cash',
  Payment.card: 'card',
  Payment.online: 'online',
};

const _$PlaceEnumMap = {
  Place.home: 'home',
  Place.shop: 'shop',
};
