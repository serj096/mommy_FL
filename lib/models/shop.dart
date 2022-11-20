import 'package:json_annotation/json_annotation.dart';
import 'converters.dart';
import 'service.dart';
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

  Shop(this.id, this.name, this.rating, this.city, this.address, this.coords);

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}

@JsonSerializable()
class ShopInfo
{
  @JsonKey(name: 'Description')
  @JsonKey(required: true)
  late String description;

  @JsonKey(name: 'Holidays')
  @JsonKey(required: true)
  late HolidayInfo holidays;

  @JsonKey(name: 'Services')
  @JsonKey(required: true)
  late List<Service> services;

  // todo
  // WorkPhoto
  // Certificates

  ShopInfo(this.description, this.holidays, this.services);

  factory ShopInfo.fromJson(Map<String, dynamic> json) => _$ShopInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ShopInfoToJson(this);
}

@JsonSerializable()
class HolidayInfo
{
  // todo
  HolidayInfo();

  factory HolidayInfo.fromJson(Map<String, dynamic> json) => _$HolidayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayInfoToJson(this);
}