import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User
{
  @JsonKey(required: true)
  late final String phone;

  @JsonKey(required: true)
  late String firstName;

  @JsonKey(required: false)
  @JsonKey(defaultValue: "")
  late String surName;

  @JsonKey(required: false)
  @JsonKey(defaultValue: "")
  late String patronymic;

  @JsonKey(required: true)
  late bool isWoman;

  @JsonKey(required: false)
  @JsonKey(defaultValue: "")
  late String city;

  @JsonKey(required: false)
  @JsonKey(defaultValue: "")
  late String address;

  User(this.phone, this.firstName, this.surName, this.patronymic, this.isWoman, this.city, this.address);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String firstLetter() => firstName.substring(0,1);
}