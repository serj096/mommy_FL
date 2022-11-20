// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['phone', 'firstName', 'isWoman'],
  );
  return User(
    json['phone'] as String,
    json['firstName'] as String,
    json['surName'] as String,
    json['patronymic'] as String,
    json['isWoman'] as bool,
    json['city'] as String,
    json['address'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'phone': instance.phone,
      'firstName': instance.firstName,
      'surName': instance.surName,
      'patronymic': instance.patronymic,
      'isWoman': instance.isWoman,
      'city': instance.city,
      'address': instance.address,
    };
