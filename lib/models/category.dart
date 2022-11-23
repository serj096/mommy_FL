import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category
{
  @JsonKey(name: 'Id')
  @JsonKey(required: true)
  final int id;

  @JsonKey(name: 'Name')
  @JsonKey(required: true)
  final String name;

  Category(this.id, this.name);

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}