// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['Phone'] as String,
      json['FirstName'] as String,
      json['SurName'] as String,
      json['Patronymic'] as String,
      json['IsWoman'] as bool,
      json['City'] as String,
      json['Address'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Phone': instance.phone,
      'FirstName': instance.firstName,
      'SurName': instance.surName,
      'Patronymic': instance.patronymic,
      'IsWoman': instance.isWoman,
      'City': instance.city,
      'Address': instance.address,
    };
