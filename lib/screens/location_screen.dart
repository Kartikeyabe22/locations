import 'package:flutter/material.dart';
import 'package:locations/screens/loading_screen.dart';
import 'package:locations/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locations/services/weather.dart';



class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});

  final locationWeather;


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather=WeatherModel();
   int? temperature;
   String weatherIcon='';
   String? cityName;
   String weatherMessage='';
   int? condition;

  @override
  void initState() {
    super.initState();
    updateUI (widget.locationWeather);
  }
  updateUI(dynamic weatherData)
  async{
    setState(() {


    var weatherDescription = weatherData['weather'][0]['description'];
    print(weatherDescription);


    double temp=weatherData['main']['temp'];
      temperature = temp.toInt() ;
    print(temperature);


     condition =weatherData['weather'][0]['id'];//this condition will only exist here
    weatherIcon=  weather.getWeatherIcon(condition!);
    print(weatherIcon);
    weatherMessage=weather.getMessage(temperature!);
    print(condition);


     cityName=weatherData['name'];
    print(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: TextStyle(
                        fontSize: 100,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//
// var weatherDescription = decodeData['weather'][0]['description'];
// print(weatherDescription);
//
// int condition=decodeData['weather'][0]['id'];
// print(condition);
//
// double temperature=decodeData['main']['temp'];
// print(temperature);
//
// String cityName=decodeData['name'];
// print(cityName);