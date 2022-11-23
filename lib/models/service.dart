import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service
{
  @JsonKey(name: "Id")
  @JsonKey(required: true)
  final int id;

  @JsonKey(name: 'CategoryId')
  @JsonKey(required: true)
  final int categoryId;

  @JsonKey(name: 'Name')
  @JsonKey(required: true)
  String name;

  @JsonKey(name: 'Description')
  @JsonKey(required: true)
  String description;

  @JsonKey(name: 'Price')
  @JsonKey(required: true)
  int price;

  Service(this.id, this.categoryId, this.name, this.description, this.price);

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}