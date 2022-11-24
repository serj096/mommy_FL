import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:math';

// todo
// exception messages
class CustomDoublePointJsonConverter implements JsonConverter<Point<double>, Map<String, dynamic>>
{
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

// todo
// exception messages
class CustomTimeOfDayJsonConverter implements JsonConverter<TimeOfDay, Map<String, dynamic>>
{
  const CustomTimeOfDayJsonConverter();

  @override
  TimeOfDay fromJson(Map<String, dynamic> json) {
    int? hour, minute;

    if (!json.containsKey('hour') || !json.containsKey('minute')) {
      throw const FormatException();
    }

    hour = int.tryParse(json['hour'].toString());
    minute = int.tryParse(json['minute'].toString());

    if (hour == null || minute == null) {
      throw const FormatException();
    }
    
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  Map<String, dynamic> toJson (TimeOfDay td) {
    return <String, dynamic> {
      'hour': td.hour,
      'minute': td.minute
    };
  }
}