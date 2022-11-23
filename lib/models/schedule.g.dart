// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthSchedule _$MonthScheduleFromJson(Map<String, dynamic> json) =>
    MonthSchedule(
      DateTime.parse(json['Month'] as String),
      (json['SpecificDays'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), WorkDayInfo.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$MonthScheduleToJson(MonthSchedule instance) =>
    <String, dynamic>{
      'Month': instance.month.toIso8601String(),
      'SpecificDays':
          instance.specificDays.map((k, e) => MapEntry(k.toString(), e)),
    };

WeekSchedule _$WeekScheduleFromJson(Map<String, dynamic> json) => WeekSchedule(
      WorkDayInfo.fromJson(json['Monday'] as Map<String, dynamic>),
      WorkDayInfo.fromJson(json['Tuesday'] as Map<String, dynamic>),
      WorkDayInfo.fromJson(json['Wednesday'] as Map<String, dynamic>),
      WorkDayInfo.fromJson(json['Thursday'] as Map<String, dynamic>),
      WorkDayInfo.fromJson(json['Friday'] as Map<String, dynamic>),
      WorkDayInfo.fromJson(json['Saturday'] as Map<String, dynamic>),
      WorkDayInfo.fromJson(json['Sunday'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeekScheduleToJson(WeekSchedule instance) =>
    <String, dynamic>{
      'Monday': instance.monday,
      'Tuesday': instance.tuesday,
      'Wednesday': instance.wednesday,
      'Thursday': instance.thursday,
      'Friday': instance.friday,
      'Saturday': instance.saturday,
      'Sunday': instance.sunday,
    };

WorkDayInfo _$WorkDayInfoFromJson(Map<String, dynamic> json) => WorkDayInfo(
      const CustomTimeOfDayJsonConverter()
          .fromJson(json['WorkStart'] as Map<String, dynamic>),
      const CustomTimeOfDayJsonConverter()
          .fromJson(json['WorkEnd'] as Map<String, dynamic>),
      (json['Breaks'] as List<dynamic>)
          .map((e) => WorkBreak.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['IsWorkDay'] as bool,
    );

Map<String, dynamic> _$WorkDayInfoToJson(WorkDayInfo instance) =>
    <String, dynamic>{
      'WorkStart':
          const CustomTimeOfDayJsonConverter().toJson(instance.workStart),
      'WorkEnd': const CustomTimeOfDayJsonConverter().toJson(instance.workEnd),
      'Breaks': instance.breaks,
      'IsWorkDay': instance.isWorkDay,
    };

WorkBreak _$WorkBreakFromJson(Map<String, dynamic> json) => WorkBreak(
      const CustomTimeOfDayJsonConverter()
          .fromJson(json['Start'] as Map<String, dynamic>),
      const CustomTimeOfDayJsonConverter()
          .fromJson(json['End'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkBreakToJson(WorkBreak instance) => <String, dynamic>{
      'Start': const CustomTimeOfDayJsonConverter().toJson(instance.start),
      'End': const CustomTimeOfDayJsonConverter().toJson(instance.end),
    };
