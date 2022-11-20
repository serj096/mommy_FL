// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['categoryId', 'name', 'description', 'price'],
  );
  return Service(
    json['categoryId'] as int,
    json['name'] as String,
    json['description'] as String,
    json['price'] as int,
  );
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
    };
