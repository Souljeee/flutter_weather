import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/search_widget/search_widget_cubit.dart';
import 'package:weather_app/pages/search_page/search_page_widgets/search_city_info_widget.dart';

import '../../../data/current_weather_model/weather.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController controller = TextEditingController();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchWidgetCubit>(context);
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          TextField(
            textInputAction: TextInputAction.search,
            onChanged: (text) {
              searchCubit.onSearchChanged(text);
            },
            decoration: const InputDecoration(
              isDense: true,
              isCollapsed: false,
              filled: true,
              hintText: "Search for a city",
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          BlocBuilder<SearchWidgetCubit, SearchWidgetState>(
            builder: (context, state) {
              if (state is SearchWidgetSuccess) {
                List<Weather> cityList = state.cityWeatherList;
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Colors.white,
                    ),
                    itemCount: cityList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchCityInfo(item: cityList[index]);
                    },
                  ),
                );
              } else if (state is SearchWidgetLoading) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              } else if (state is SearchWidgetNothingFound) {
                return const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "Ничего не найдено",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              } else if (state is SearchWidgetError) {
                return const Center(
                  child: Text("Произошла ошибка"),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
