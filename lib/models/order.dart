import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order
{
  @JsonKey(name: 'ShopId')
  @JsonKey(required: true)
  late int shopId;

  @JsonKey(required: true)
  @JsonKey(name: 'PayType')
  late Payment payType;

  @JsonKey(name: 'IsCompleted')
  @JsonKey(required: true)
  late bool isCompleted;

  @JsonKey(name: 'Time')
  @JsonKey(required: true)
  late DateTime time;

  @JsonKey(name: 'Location')
  @JsonKey(required: true)
  late Place location;

  @JsonKey(name: 'Services')
  @JsonKey(required: true)
  late List<int> services;

  Order(this.shopId, this.payType, this.isCompleted, this.time, this.location, this.services);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

enum Payment
{
  cash,
  card,
  online
}

enum Place
{
  home,
  shop
}
