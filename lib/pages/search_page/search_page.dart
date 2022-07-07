import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/data_sources/repository.dart';
import 'package:weather_app/pages/search_page/search_page_widgets/search_widget.dart';
import 'package:weather_app/pages/search_page/search_page_widgets/weather_card_widget.dart';

import '../../cubit/search_widget/search_widget_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _SearchPageContent();
  }
}

class _SearchPageContent extends StatelessWidget {
  const _SearchPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchWidgetCubit(WeatherRepository()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 130),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: WeatherCard(),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 30),
                Padding(
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
                  padding: EdgeInsets.all(8.0),
                  child: SearchWidget(),
                ),
                SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
