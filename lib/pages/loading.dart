import 'package:flutter/material.dart';
import 'package:backyard_hacks/service/city_aqi.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  final Map argsFromMapScreen;

  //receive the city argument
  Loading(this.argsFromMapScreen);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //asynchronous request
  void setupCityAQI(Map argsFromMapScreen) async {
    CityAQI instance = CityAQI(city: argsFromMapScreen['city']);

    await instance.getData();

    //cant print property of instance right away because out of scope of async so add Future keyword to getData()
    //also can then put await in front of getData(), which prompts putting sync in header
    print(instance.city);
    print(instance.time);
    print(instance.aqi);
    print(instance.o3_forecast);
    print(instance.pm10_forecast);
    print(instance.pm25_forecast);

    //redirect to home page
    //instead of keeping home route underneath loading route, we can do replacementnamed, so that it will replace the home underneath
    //home no longer under route
    Navigator.pushReplacementNamed(context, '/city_info', arguments: {
      'city': instance.city,
      'time': instance.time,
      'aqi': instance.aqi,
      'o3_forecast': instance.o3_forecast,
      'pm10_forecast': instance.pm10_forecast,
      'pm25_forecast': instance.pm25_forecast,
    });
  }

  @override
  void initState() {
    super.initState();
    setupCityAQI(widget.argsFromMapScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 137, 146),
      body: const Center(
        //child: Text('loading'),
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
