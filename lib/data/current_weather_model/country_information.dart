import 'package:json_annotation/json_annotation.dart';

part 'country_information.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CountryInformation {
  String country;

  CountryInformation(this.country);

  factory CountryInformation.fromJson(Map<String, dynamic> json) =>
      _$CountryInformationFromJson(json);

  Map<String, dynamic> toJson() => _$CountryInformationToJson(this);
}
