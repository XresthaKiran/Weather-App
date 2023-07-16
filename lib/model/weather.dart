import 'package:weather_app/model/location.dart';
import 'package:weather_app/model/temp_condition.dart';

class Weather {
  final Location location;
  final Current current;

  Weather({required this.location, required this.current});
}
