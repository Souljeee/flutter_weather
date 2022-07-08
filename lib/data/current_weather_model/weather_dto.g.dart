// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDTO _$WeatherDTOFromJson(Map<String, dynamic> json) => WeatherDTO(
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      MainInfo.fromJson(json['main'] as Map<String, dynamic>),
      json['name'] as String,
      CountryInformation.fromJson(json['sys'] as Map<String, dynamic>),
      Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherDTOToJson(WeatherDTO instance) =>
    <String, dynamic>{
      'weather': instance.weatherInfo,
      'main': instance.main,
      'name': instance.name,
      'sys': instance.country,
      'coord': instance.coordinates,
    };
