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
      body: Container(
        height: MediaQuery.of(context).size.height,          // adapts the height and width according to screen size
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [ Color.fromARGB(255, 100, 181, 246),Color.fromARGB(255, 21, 101, 192),])
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24)
              ),
              child: TextField(
                controller: searchController,
                onChanged: filterCities,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search City',
                  prefixIcon: Icon(Icons.search)
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCities.length,
                itemBuilder: (BuildContext context, int index) {
                  final city = filteredCities[index];
                  return Padding(
                    padding: const EdgeInsets.only(left:16.0,right: 16,),
                    child: Card(
                      
                      shadowColor: Colors.black26,
                      child: ListTile(
                        
                        tileColor: const Color.fromARGB(255, 147, 137, 137).withOpacity(0.5),
                        title: Text(city.city),
                        subtitle: Text(city.country),
                        onTap: () {
                          Navigator.pop(context, city);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
