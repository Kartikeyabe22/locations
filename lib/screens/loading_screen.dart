import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locations/services/location.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:locations/services/networking.dart';
import 'package:locations/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey='896d520e20f04d5efd8c2fc1948f15c8';


String str='';
String n='';



class LoadingScreen extends StatefulWidget {

  @override

  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double longitude;
  late double latitude;

  @override
  void initState() {

    super.initState();
    getLocationData();

  }

  void getLocationData()
 async {
    Location location= Location();//creating object
    await location.getCurrentLocation();
    latitude=location.latitude;
    longitude=location.longitude;



    NetworkHelper networkhelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkhelper.getData();





    // var weatherDescription = weatherData['weather'][0]['description'];
    // print(weatherDescription);
    //
    // int condition=weatherData['weather'][0]['id'];
    // print(condition);
    //
    // double temperature=weatherData['main']['temp'];
    // print(temperature);
    //
    // String cityName=weatherData['name'];
    // print(cityName);

    Navigator.push(context,MaterialPageRoute(builder:(context){
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
      child: SpinKitPumpingHeart(
        color:Colors.red,
       size: 300,
      ),),
    );
  }
}

