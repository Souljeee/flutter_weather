import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/search_page/search_page_widgets/search_widget.dart';
import 'package:weather_app/pages/search_page/search_page_widgets/weather_card_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SearchPageContent();
  }
}

class _SearchPageContent extends StatelessWidget {
  const _SearchPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchWidget(),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: WeatherCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
