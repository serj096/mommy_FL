import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User
{
  @JsonKey(name: 'Phone')
  @JsonKey(required: true)
  late final String phone;

  @JsonKey(name: 'FirstName')
  @JsonKey(required: true)
  late String firstName;

  @JsonKey(name: 'SurName')
  @JsonKey(required: false)
  @JsonKey(defaultValue: "")
  late String surName;

  @JsonKey(name: 'Patronymic')
  @JsonKey(required: false)
  @JsonKey(defaultValue: "")
  late String patronymic;

  @JsonKey(name: 'IsWoman')
  @JsonKey(required: true)
  late bool isWoman;

  @JsonKey(name: 'City')
  @JsonKey(required: false)
  @JsonKey(defaultValue: "")
  late String city;

  @JsonKey(name: 'Address')
  @JsonKey(required: false)
  @JsonKey(defaultValue: "")
  late String address;

  User(this.phone, this.firstName, this.surName, this.patronymic, this.isWoman, this.city, this.address);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String firstLetter() => firstName[0].toUpperCase();

  String fullName() {
    String result = "";

    if (surName != "") {
      result += "$surName ";
    }

    result += firstName;

    if (patronymic != "") {
      result += " $patronymic";
    }

    return result;
  }
}