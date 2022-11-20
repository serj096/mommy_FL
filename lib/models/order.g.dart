// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'shopId',
      'payType',
      'isCompleted',
      'time',
      'location',
      'services'
    ],
  );
  return Order(
    json['shopId'] as int,
    $enumDecode(_$PaymentEnumMap, json['payType']),
    json['isCompleted'] as bool,
    DateTime.parse(json['time'] as String),
    $enumDecode(_$PlaceEnumMap, json['location']),
    (json['services'] as List<dynamic>).map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'shopId': instance.shopId,
      'payType': _$PaymentEnumMap[instance.payType]!,
      'isCompleted': instance.isCompleted,
      'time': instance.time.toIso8601String(),
      'location': _$PlaceEnumMap[instance.location]!,
      'services': instance.services,
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
