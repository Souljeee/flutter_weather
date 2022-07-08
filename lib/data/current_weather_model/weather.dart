class Weather {
  final String cityName;
  final int temperature;
  final String description;
  final String country;
  final String lat;
  final String lon;
  bool isFavourite;

  Weather(
    this.cityName,
    this.temperature,
    this.description,
    this.country,
    this.lat,
    this.lon,
    this.isFavourite,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weather &&
          runtimeType == other.runtimeType &&
          cityName == other.cityName &&
          temperature == other.temperature &&
          description == other.description &&
          country == other.country &&
          lat == other.lat &&
          lon == other.lon &&
          isFavourite == other.isFavourite;

  @override
  int get hashCode =>
      cityName.hashCode ^
      temperature.hashCode ^
      description.hashCode ^
      country.hashCode ^
      lat.hashCode ^
      lon.hashCode ^
      isFavourite.hashCode;
}
