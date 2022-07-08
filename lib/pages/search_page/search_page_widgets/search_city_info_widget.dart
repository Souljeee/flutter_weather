import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/search_widget/search_widget_cubit.dart';
import '../../../data/current_weather_model/weather.dart';

class SearchCityInfo extends StatelessWidget {
  final Weather item;

  const SearchCityInfo({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchWidgetCubit>(context);
    return GestureDetector(
      onTap: () {
        searchCubit.putWeatherIntoStorage(item);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "${item.cityName}, ${item.country}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
