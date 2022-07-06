import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/weather_cubit.dart';
import '../../data/data_sources/repository.dart';
import '../../data/future_weather_model/future_weather.dart';
import 'weather_page_widgets/weather_item_horizontal_widget.dart';
import 'weather_page_widgets/weather_item_vertical_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherRepository()),
      child: const Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: _WeatherPageContent(),
        ),
      ),
    );
  }
}

class _WeatherPageContent extends StatefulWidget {
  const _WeatherPageContent({Key? key}) : super(key: key);

  @override
  State<_WeatherPageContent> createState() => _WeatherPageContentState();
}

class _WeatherPageContentState extends State<_WeatherPageContent> {
  @override
  void initState() {
    super.initState();
    final weatherCubit = BlocProvider.of<WeatherCubit>(context);
    weatherCubit.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherSuccess) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  CurrentWeatherInfoWidget(
                    cityName: state.weather.cityName,
                    temp: state.weather.temperature,
                    weatherDescription: state.weather.description,
                  ),
                  const SizedBox(height: 30),
                  TodayWeatherInfoWidget(
                    weatherList: state.weatherByThreeHourList,
                  ),
                  Expanded(
                    child: FutureWeather(
                      weatherList: state.weatherByDateList,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is WeatherError) {
            return Center(child: Text("Error"));
          } else if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}

class CurrentWeatherInfoWidget extends StatelessWidget {
  final String cityName;
  final int temp;
  final String weatherDescription;

  const CurrentWeatherInfoWidget({
    Key? key,
    required this.cityName,
    required this.temp,
    required this.weatherDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cityName,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
        Text(
          temp.toString(),
          style: const TextStyle(fontSize: 60, color: Colors.white),
        ),
        Text(
          weatherDescription,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}

class TodayWeatherInfoWidget extends StatelessWidget {
  final List<FutureWeatherInfo> weatherList;

  const TodayWeatherInfoWidget({
    Key? key,
    required this.weatherList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            final weatherItem = weatherList[index];
            return WeatherItemVerticalWidget(
              weatherItem: weatherItem,
            );
          },
        ),
      ),
    );
  }
}

class FutureWeather extends StatelessWidget {
  final List<FutureWeatherInfo> weatherList;

  const FutureWeather({
    Key? key,
    required this.weatherList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return WeatherItemHorizontalWidgets(
              weatherItem: weatherList[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.white,
          ),
          itemCount: weatherList.length,
        ),
      ),
    );
  }
}
