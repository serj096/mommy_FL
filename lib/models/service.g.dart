// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      json['Id'] as int,
      json['CategoryId'] as int,
      json['Name'] as String,
      json['Description'] as String,
      json['Price'] as int,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'Id': instance.id,
      'CategoryId': instance.categoryId,
      'Name': instance.name,
      'Description': instance.description,
      'Price': instance.price,
    };
