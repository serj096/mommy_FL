import 'package:json_annotation/json_annotation.dart';
import 'converters.dart';
import 'package:latlong2/latlong.dart';

part 'shop.g.dart';

@JsonSerializable()
class Shop
{
  @JsonKey(name: 'Id')
  @JsonKey(required: true)
  final int id;

  @JsonKey(name: 'Name')
  @JsonKey(required: true)
  String name;

  @JsonKey(name: 'Rating')
  @JsonKey(required: true)
  int rating;

  @JsonKey(name: 'City')
  @JsonKey(required: true)
  String city;

  @JsonKey(name: 'Address')
  @JsonKey(required: true)
  String address;

  @JsonKey(name: 'Coordinates')
  @JsonKey(required: true)
  @CustomDoublePointJsonConverter()
  LatLng coords;

  @JsonKey(name: 'Description')
  @JsonKey(required: true)
  String description;

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