// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_city_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCityList _$WeatherCityListFromJson(Map<String, dynamic> json) =>
    WeatherCityList(
      (json['list'] as List<dynamic>)
          .map((e) => WeatherDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['cod'] as String,
    );

Map<String, dynamic> _$WeatherCityListToJson(WeatherCityList instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'list': instance.weatherList,
    };
