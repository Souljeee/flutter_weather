import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/utils/weather_icons.dart';

import '../../../cubit/search_page/search_cubit.dart';
import '../../../data/current_weather_model/weather.dart';

class WeatherCard extends StatefulWidget {
  final Weather item;
  final VoidCallback onTap;

  const WeatherCard({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 4),
                      child: Text(
                        widget.item.cityName,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 4),
                      child: Text(
                        widget.item.description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _calculateCelsius(widget.item.temperature).toString(),
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 60, top: 5),
              child: GestureDetector(
                onTap: () {
                  searchCubit.updateFavourite(widget.item);
                },
                child: Image.asset(
                  WeatherIcons.starEmpty,
                  width: 30,
                  height: 30,
                  color: widget.item.isFavourite ? Colors.yellow : Colors.black,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  int _calculateCelsius(int temperature) {
    return (temperature - 273.15).round();
  }
}
