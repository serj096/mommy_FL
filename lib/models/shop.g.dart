// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      json['Id'] as int,
      json['Name'] as String,
      json['Rating'] as int,
      json['City'] as String,
      json['Address'] as String,
      const CustomDoublePointJsonConverter()
          .fromJson(json['Coordinates'] as Map<String, dynamic>),
      json['Description'] as String,
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Rating': instance.rating,
      'City': instance.city,
      'Address': instance.address,
      'Coordinates':
          const CustomDoublePointJsonConverter().toJson(instance.coords),
      'Description': instance.description,
    };
