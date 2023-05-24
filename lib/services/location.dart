import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{

  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);

      latitude=position.latitude;
      longitude=position.longitude;


      //
      // print('${position.longitude.toString()}');
      // String n = position.longitude.toString();
      // double number = double.parse(n);
      // if (number > 76) {
      //   setState(() {
      //     str = 'inside library';
      //   });
      // }
      // if (number < 75.6540404040) {
      //   setState(() {
      //     str = 'J hostel mess';
      //   });
      // }
      print(position);



    }

    catch (e) {
      print(e);
    };
  }

}