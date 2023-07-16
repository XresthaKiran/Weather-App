import 'package:flutter/material.dart';
import 'package:weather_app/model/city.dart';

class CitySelectionScreen extends StatefulWidget {
  const CitySelectionScreen({super.key});

  @override
  CitySelectionScreenState createState() => CitySelectionScreenState();
}

class CitySelectionScreenState extends State<CitySelectionScreen> {
  TextEditingController searchController = TextEditingController();
  List<City> filteredCities = City.citiesList;

  @override
  void initState() {
    super.initState();
    filteredCities.sort((a, b) => a.city.compareTo(b.city));
  }

  void filterCities(String cityName) {
    setState(() {
      filteredCities = City.citiesList
          .where((city) =>
              city.city.toLowerCase().startsWith(cityName.toLowerCase()))
          .toList();
      filteredCities.sort((a, b) => a.city.compareTo(b.city));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: filterCities,
              decoration: InputDecoration(
                labelText: 'Search City',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (BuildContext context, int index) {
                final city = filteredCities[index];
                return ListTile(
                  title: Text(city.city),
                  subtitle: Text(city.country),
                  onTap: () {
                    Navigator.pop(context, city);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
