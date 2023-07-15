import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:weather_app/model/location.dart';
import 'package:weather_app/model/temp_condition.dart';
import 'package:weather_app/model/weather.dart';

class WeatherApi{
    static Future<List<Weather>> getData() async {
    const url='http://api.weatherapi.com/v1/current.json?key=1bc0383d81444b58b1432929200711&q=48.8567,2.350';
    final uri=Uri.parse(url);
    final response =await http.get(uri);
    final body= response.body;
    final json=jsonDecode(body);
    final results=json as List<dynamic>;
    final information = results.map((e){
      final location= Location(name: e['location']['name'], country: e['location']['country'], lat: e['location']['lat'], lon: e['location']['lon']);
      final condition = WeatherCondition(text:e['current']['condition']['text'], icon: e['current']['condition']['icon']);
      final current = Current(temp: e['temp_c'], condition: condition);
      return Weather(location: location, current: current);
    }).toList();
     return information;
  }
}