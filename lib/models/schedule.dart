import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mommy/models/converters.dart';

part 'schedule.g.dart';

@JsonSerializable()
class MonthSchedule
{
  @JsonKey(name: "Month")
  @JsonKey(required: true)
  final DateTime month;

  @JsonKey(name: "SpecificDays")
  @JsonKey(required: false)
  @JsonKey(defaultValue: <int, WorkDayInfo>{})
  Map<int, WorkDayInfo> specificDays;

  MonthSchedule(this.month, this.specificDays);

  factory MonthSchedule.fromJson(Map<String, dynamic> json) => _$MonthScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$MonthScheduleToJson(this);
}

@JsonSerializable()
class WeekSchedule
{
  @JsonKey(name: "Monday")
  @JsonKey(required: true)
  WorkDayInfo monday;

  @JsonKey(name: "Tuesday")
  @JsonKey(required: true)
  WorkDayInfo tuesday;

  @JsonKey(name: "Wednesday")
  @JsonKey(required: true)
  WorkDayInfo wednesday;

  @JsonKey(name: "Thursday")
  @JsonKey(required: true)
  WorkDayInfo thursday;

  @JsonKey(name: "Friday")
  @JsonKey(required: true)
  WorkDayInfo friday;

  @JsonKey(name: "Saturday")
  @JsonKey(required: true)
  WorkDayInfo saturday;

  @JsonKey(name: "Sunday")
  @JsonKey(required: true)
  WorkDayInfo sunday;

  WeekSchedule(this.monday, this.tuesday, this.wednesday,
      this.thursday, this.friday, this.saturday, this.sunday);

  factory WeekSchedule.fromJson(Map<String, dynamic> json) => _$WeekScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$WeekScheduleToJson(this);
}

@JsonSerializable()
class WorkDayInfo {

  @JsonKey(name: "WorkStart")
  @JsonKey(required: true)
  @CustomTimeOfDayJsonConverter()
  TimeOfDay workStart;

  @JsonKey(name: "WorkEnd")
  @JsonKey(required: true)
  @CustomTimeOfDayJsonConverter()
  TimeOfDay workEnd;

  @JsonKey(name: "Breaks")
  @JsonKey(required: false)
  @JsonKey(defaultValue: <WorkBreak>[])
  List<WorkBreak> breaks;

  @JsonKey(name: "IsWorkDay")
  @JsonKey(required: true)
  bool isWorkDay;

  WorkDayInfo(this.workStart, this.workEnd, this.breaks, this.isWorkDay);

  factory WorkDayInfo.fromJson(Map<String, dynamic> json) => _$WorkDayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkDayInfoToJson(this);
}

@JsonSerializable()
class WorkBreak
{
  @JsonKey(name: "Start")
  @JsonKey(required: true)
  @CustomTimeOfDayJsonConverter()
  TimeOfDay start;

  @JsonKey(name: "End")
  @JsonKey(required: true)
  @CustomTimeOfDayJsonConverter()
  TimeOfDay end;

  WorkBreak(this.start, this.end);

  factory WorkBreak.fromJson(Map<String, dynamic> json) => _$WorkBreakFromJson(json);

  Map<String, dynamic> toJson() => _$WorkBreakToJson(this);
}