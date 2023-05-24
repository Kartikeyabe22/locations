import 'package:locations/services/networking.dart';
import 'package:locations/screens/location_screen.dart';
import 'package:http/http.dart';

import 'location.dart';
const apiKey='896d520e20f04d5efd8c2fc1948f15c8';
class WeatherModel {
  late double longitude;
  late double latitude;


  Future<dynamic> getCityWeather(String cityName)
  async{
    var url= 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData= await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic>getLocationWeather()
 async {
    Location location= Location();//creating object
    await location.getCurrentLocation();
    latitude=location.latitude;
    longitude=location.longitude;
    NetworkHelper networkhelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
