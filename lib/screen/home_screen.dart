import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/screen/help_screen.dart';
import 'package:weather_app/screen/select_city.dart';
import 'package:weather_app/services/weather_api.dart';
import 'package:weather_icons/weather_icons.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  Weather? weather;
  TextEditingController searchController = TextEditingController();
  List<City> filteredCities = City.citiesList;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    try {
      final fetchedWeather = await WeatherApi.getData('london');    //To get the weather information using dafault city=London
      setState(() {
        weather = fetchedWeather;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchWeatherDataForCity(String cityName) async {
    try {
      final fetchedWeather = await WeatherApi.getData(cityName);  //To get the weather information using cityName from the search/citiesList
      setState(() {
        weather = fetchedWeather;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> openCitySelection() async {
    final selectedCity = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CitySelectionScreen()),  //Opens CitySelectionScreen to search and select the city
    );
    if (selectedCity != null) {
      fetchWeatherDataForCity(selectedCity.city);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,               //solves screen overflow due to keyboard open
      floatingActionButton: FloatingActionButton(
        onPressed: openCitySelection,
        child: const Icon(Icons.search),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,          // adapts the height and width according to screen size
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color.fromARGB(255, 21, 101, 192), Color.fromARGB(255, 100, 181, 246)])
        ),
        
        child: SingleChildScrollView(
          child: Column(
            children: [
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      'Weather APP',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xfff7e5b7),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 25),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpScreen(),
                          ),
                        );
                      },
                      child: const Text('Help'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if(weather!=null)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),                  
                    color: Colors.white.withOpacity(0.5),                  // Container to display weather conditon.
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(26),
                  height: 100,
                  
                  child: Row(
                    children: [
                      Image.network(
                          'https:${weather!.current.condition.icon}'),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weather!.current.condition.text,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                              'In ${weather!.location.name},${weather!.location.country}',
                              style: const TextStyle(fontSize: 16))
                        ],
                      )
                    ],
                  ),
                ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),            // Container to show Temperature.
                  color: Colors.white.withOpacity(0.5),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(26),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          WeatherIcons.thermometer,
                          color: Color.fromARGB(255, 57, 90, 99),
                          size: 45,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('TEMPERATURE',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (weather != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text(
                              weather!.current.temp.toString(),
                              style: const TextStyle(fontSize: 50),
                            ),
                          ),
                        const Text(
                          'o',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 30),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            'C',
                            style: TextStyle(
                                fontSize: 55, fontWeight: FontWeight.w200),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
                
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),                    // Container to show Humidity
                        color: Colors.white.withOpacity(0.5)),
                    margin: const EdgeInsets.fromLTRB(26, 0, 10, 0),
                    padding: const EdgeInsets.all(26),
                    height: 200,
                    child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          WeatherIcons.humidity,
                          color: Color.fromARGB(255, 57, 90, 99),
                          size: 25,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('HUMIDITY',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (weather != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: Text(
                              '${weather!.current.humidity.toString()}%',
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                    
                    
                      ],
                    )
                  ],
                ),
                  
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: const EdgeInsets.fromLTRB(10, 0, 26, 0),                               //  Container to show Wind speed
                    padding: const EdgeInsets.all(26),
                    height: 200,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          WeatherIcons.day_windy,
                          color: Color.fromARGB(255, 57, 90, 99),
                          size: 25,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('WIND',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (weather != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Text(
                              weather!.current.wind.toString(),
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                        
                        
                      ],
                    ),
                    const Center(
                      child: Text(
                        'km/hr',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                  
                ),
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}
