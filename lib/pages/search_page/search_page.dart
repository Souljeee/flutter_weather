import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/search_widget/search_widget_cubit.dart';
import 'package:weather_app/data/data_sources/repository_local.dart';
import 'package:weather_app/data/data_sources/repository_remote.dart';
import 'package:weather_app/data/data_sources/weather_storage.dart';
import 'package:weather_app/pages/search_page/search_page_widgets/search_widget.dart';
import 'package:weather_app/pages/search_page/search_page_widgets/weather_card_widget.dart';

import '../../cubit/search_page/search_cubit.dart';
import '../weather_page/weather_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(
        WeatherRepositoryRemote(),
        WeatherLocalRepository(
          WeatherStorage(),
        ),
      ),
      child: const _SearchPageContent(),
    );
  }
}

class _SearchPageContent extends StatefulWidget {
  const _SearchPageContent({Key? key}) : super(key: key);

  @override
  State<_SearchPageContent> createState() => _SearchPageContentState();
}

class _SearchPageContentState extends State<_SearchPageContent> {
  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 130),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchSuccess) {
                    final weatherList = state.cityWeatherList;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: weatherList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8),
                            child: Dismissible(
                              background: Container(
                                color: Colors.red,
                              ),
                              onDismissed: (DismissDirection direction) {
                                setState(() {
                                  weatherList.removeAt(index);
                                });
                              },
                              key: UniqueKey(),
                              child: WeatherCard(
                                item: weatherList[index],
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => WeatherPage(
                                        lat: weatherList[index].lat,
                                        lon: weatherList[index].lon,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Weather",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocProvider<SearchWidgetCubit>(
                  create: (context) => SearchWidgetCubit(
                    WeatherRepositoryRemote(),
                    WeatherLocalRepository(
                      WeatherStorage(),
                    ),
                    searchCubit,
                  ),
                  child: const SearchWidget(),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}
