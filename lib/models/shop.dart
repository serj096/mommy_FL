import 'package:json_annotation/json_annotation.dart';
import 'service.dart';

part 'shop.g.dart';

@JsonSerializable()
class Shop
{
  @JsonKey(required: true)
  late int id;

  @JsonKey(required: true)
  late String name;

  @JsonKey(required: true)
  late int rating;

  @JsonKey(required: true)
  late String city;

  @JsonKey(required: true)
  late String address;

  @JsonKey(required: false)
  late ShopInfo? info;

  Shop(this.id, this.name, this.rating, this.city, this.address, this.info);

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}

@JsonSerializable()
class ShopInfo
{
  @JsonKey(required: true)
  late String description;

  @JsonKey(required: true)
  late HollidayInfo hollidays;

  @JsonKey(required: true)
  late List<Service> services;

  // todo
  // WorkPhoto
  // Sertificates

  ShopInfo(this.description, this.hollidays, this.services);

  factory ShopInfo.fromJson(Map<String, dynamic> json) => _$ShopInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ShopInfoToJson(this);
}

@JsonSerializable()
class HollidayInfo
{
  // todo
  HollidayInfo() { }

  factory HollidayInfo.fromJson(Map<String, dynamic> json) => _$HollidayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HollidayInfoToJson(this);
}