import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service
{
  @JsonKey(name: "Id")
  @JsonKey(required: true)
  late int id;

  @JsonKey(name: 'CategoryId')
  @JsonKey(required: true)
  late int categoryId;

  @JsonKey(name: 'Name')
  @JsonKey(required: true)
  late String name;

  @JsonKey(name: 'Description')
  @JsonKey(required: true)
  late String description;

  @JsonKey(name: 'Price')
  @JsonKey(required: true)
  late int price;

  Service(this.id, this.categoryId, this.name, this.description, this.price);

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}