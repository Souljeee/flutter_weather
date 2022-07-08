import 'package:collection/collection.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:weather_app/cubit/search_page/search_cubit.dart';
import 'package:weather_app/data/current_weather_model/weather.dart';
import 'package:weather_app/data/data_sources/repository_local.dart';
import 'package:weather_app/data/data_sources/repository_remote.dart';

import 'sorting_test.mocks.dart';

@GenerateMocks([
  WeatherRepositoryRemote,
  WeatherLocalRepository,
])
void main() {
  test("Sort favourite test main case", () {
    final searchCubit = SearchCubit(
      MockWeatherRepositoryRemote(),
      MockWeatherLocalRepository(),
    );

    List<Weather> cityList = [
      Weather("Краснодар", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Калуга", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Воронеж", 20, "солнечно", "ru", "34.1", "26.2", true),
      Weather("Гремячинск", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Абакан", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Бирск", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Казань", 20, "солнечно", "ru", "34.1", "26.2", true),
      Weather("Жигулевск", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Елабуга", 20, "солнечно", "ru", "34.1", "26.2", true),
      Weather("Барнаул", 20, "солнечно", "ru", "34.1", "26.2", true),
    ];

    List<Weather> actual = searchCubit.sortFavourite(cityList);

    List<Weather> expected = [
      Weather("Барнаул", 20, "солнечно", "ru", "34.1", "26.2", true),
      Weather("Воронеж", 20, "солнечно", "ru", "34.1", "26.2", true),
      Weather("Елабуга", 20, "солнечно", "ru", "34.1", "26.2", true),
      Weather("Казань", 20, "солнечно", "ru", "34.1", "26.2", true),
      Weather("Абакан", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Бирск", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Гремячинск", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Жигулевск", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Калуга", 20, "солнечно", "ru", "34.1", "26.2", false),
      Weather("Краснодар", 20, "солнечно", "ru", "34.1", "26.2", false),
    ];

    bool result = const ListEquality().equals(actual, expected);
    expect(result, true);
  });

  test("Sort favourite test empty list", () {
    final searchCubit = SearchCubit(
      MockWeatherRepositoryRemote(),
      MockWeatherLocalRepository(),
    );

    List<Weather> cityList = [];

    List<Weather> actual = searchCubit.sortFavourite(cityList);

    List<Weather> expected = [];

    bool result = const ListEquality().equals(actual, expected);
    expect(result, true);
  });
}
