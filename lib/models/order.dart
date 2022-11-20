import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order
{
  @JsonKey(required: true)
  late int shopId;

  @JsonKey(required: true)
  late Payment payType;

  @JsonKey(required: true)
  late bool isCompleted;

  @JsonKey(required: true)
  late DateTime time;

  @JsonKey(required: true)
  late Place location;

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
