import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/repository.dart';
import 'package:weather_app/widgets/weather_item_horizontal_widget.dart';

import '../model/future_weather_model/future_weather.dart';
import '../widgets/weather_item_vertical_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => WeatherCubit(WeatherRepository()),
        child: const Scaffold(
          backgroundColor: Colors.indigo,
          body: SafeArea(
            child: WeatherPage(),
          ),
        ),
      ),
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
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
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        Text(
          temp.toString(),
          style: TextStyle(fontSize: 60, color: Colors.white),
        ),
        Text(
          weatherDescription,
          style: TextStyle(fontSize: 20, color: Colors.white),
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
