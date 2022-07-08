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
}
