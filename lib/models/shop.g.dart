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
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Rating': instance.rating,
      'City': instance.city,
      'Address': instance.address,
      'Coordinates':
          const CustomDoublePointJsonConverter().toJson(instance.coords),
    };

ShopInfo _$ShopInfoFromJson(Map<String, dynamic> json) => ShopInfo(
      json['Description'] as String,
      HolidayInfo.fromJson(json['Holidays'] as Map<String, dynamic>),
      (json['Services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShopInfoToJson(ShopInfo instance) => <String, dynamic>{
      'Description': instance.description,
      'Holidays': instance.holidays,
      'Services': instance.services,
    };

HolidayInfo _$HolidayInfoFromJson(Map<String, dynamic> json) => HolidayInfo();

Map<String, dynamic> _$HolidayInfoToJson(HolidayInfo instance) =>
    <String, dynamic>{};
