class Weather {
  final String cityName;
  final int temperature;
  final String description;

  const Weather(
     this.cityName,
     this.temperature,
     this.description,
  );

  @override
  String toString() {
    return 'Weather{cityName: $cityName, temperature: $temperature, description: $description}';
  }

  @override
  int get hashCode => description.hashCode;
}
