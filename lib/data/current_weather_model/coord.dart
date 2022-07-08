import 'package:json_annotation/json_annotation.dart';

part 'coord.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Coordinates {
  double lon;
  double lat;

  Coordinates(this.lon, this.lat);

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
