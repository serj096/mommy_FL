import 'package:json_annotation/json_annotation.dart';
import 'converters.dart';
import 'dart:math';

part 'shop.g.dart';

@JsonSerializable()
class Shop
{
  @JsonKey(name: 'Id')
  @JsonKey(required: true)
  late int id;

  @JsonKey(name: 'Name')
  @JsonKey(required: true)
  late String name;

  @JsonKey(name: 'Rating')
  @JsonKey(required: true)
  late int rating;

  @JsonKey(name: 'City')
  @JsonKey(required: true)
  late String city;

  @JsonKey(name: 'Address')
  @JsonKey(required: true)
  late String address;

  @JsonKey(name: 'Coordinates')
  @JsonKey(required: true)
  @CustomDoublePointJsonConverter()
  late Point<double> coords;

  @JsonKey(name: 'Description')
  @JsonKey(required: true)
  late String description;

  Shop(this.id, this.name, this.rating, this.city, this.address, this.coords, this.description);

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}

class ShopInfo
{
  // todo
  // WorkPhoto
  // Certificates
}

@JsonSerializable()
class HolidayInfo
{
  // todo
  HolidayInfo();

  factory HolidayInfo.fromJson(Map<String, dynamic> json) => _$HolidayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayInfoToJson(this);
}