import 'package:json_annotation/json_annotation.dart';

part 'main_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MainInfo {
  double temp;

  @JsonKey(name: "temp_min")
  double minTemp;

  @JsonKey(name: "temp_max")
  double maxTemp;

  MainInfo(this.temp, this.minTemp, this.maxTemp);

  factory MainInfo.fromJson(Map<String, dynamic> json) =>
      _$MainInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MainInfoToJson(this);
}
