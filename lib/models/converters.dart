import 'package:json_annotation/json_annotation.dart';
import 'dart:math';

class CustomDoublePointJsonConverter implements JsonConverter<Point<double>, Map<String, dynamic>> {
  const CustomDoublePointJsonConverter();

  @override
  Point<double> fromJson(Map<String, dynamic> json) {
    double? x, y;

    if (!json.containsKey('x') || !json.containsKey('y')) {
      throw const FormatException();
    }

    x = double.tryParse(json['x'].toString());
    y = double.tryParse(json['y'].toString());

    if (x == null || y == null) {
      throw const FormatException();
    }

    return Point<double>(x, y);
  }

  @override
  Map<String, dynamic> toJson(Point<double> pt){
    return <String, dynamic> {
      'x': pt.x,
      'y': pt.y
    };
  }
}