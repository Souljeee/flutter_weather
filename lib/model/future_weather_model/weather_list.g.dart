// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherList _$WeatherListFromJson(Map<String, dynamic> json) => WeatherList(
      (json['list'] as List<dynamic>)
          .map((e) => WeatherFutureDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherListToJson(WeatherList instance) =>
    <String, dynamic>{
      'list': instance.weatherList,
    };
