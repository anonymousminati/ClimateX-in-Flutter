import 'package:clima/screens/location_screen.dart';

import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //create _getCurrentLocation function to get current location of device using Geolocator package and print it to console. device uses android 13 api 33. use try catch block

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();


    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        LocationWeather: weatherData,
      );
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitHourGlass(
      color: Colors.white,
      size: 100.0,
    )));
  }
}
