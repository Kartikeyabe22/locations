import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locations/services/location.dart';


String str='';
String n='';


class LoadingScreen extends StatefulWidget {

  @override

  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {

    super.initState();
    getLocation();
  }

  void getLocation()
 async {
    Location location= Location();//creating object
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);

  }




  @override
  Widget build(BuildContext context) {
    String myMargin= 'abc';
    double myMarrginASDouble;
    try {
      myMarrginASDouble = double.parse(myMargin);

    }
    catch(e){
     print (e);
     myMarrginASDouble=30.0;
    }
    return Scaffold(
        body: Container(
          margin: EdgeInsets.all( myMarrginASDouble ?? 50),
          color: Colors.red,
        )
    );
      //
      // body: Center(
      //   child:Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children:[
      //
      //       Text(
      //         str
      //         ,
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontWeight: FontWeight.bold,
      //         ),
      //          ),
      //    SizedBox(
      //      height: 70,
      //    ),
      //
      //    ElevatedButton(
      //     onPressed: () {
      //       _determinePosition();
      //     },
      //     child: Text('Get Location'),
      //   ),
      // ]
      // ),
      // ),
   //  );
  }
}
