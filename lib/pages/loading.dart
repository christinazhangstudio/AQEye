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
  /*void getData() async {
    //simulate network request for a username
    // async and await is to have the next function ('a weird baby' return) consecutive from this one completing
    // await means to "wait" for this to be done
    //async and await are needed for dependent actions
    /*String username = await Future.delayed(Duration(seconds: 3), () {
      //print('cimp');
      return 'cimp';
    });
    //simulate network request to get bio of username
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'a weird baby';
    });
    print('$username - $bio');*/
    //collect data from third party API
    //await is wait for data to be gotten before storing into variable
    /*Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);*/
    //using WorldTimeAPI
    //make the request
    /*Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
    Map data = jsonDecode(response.body);
    //print(data);
    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //print(datetime);
    //print(offset);
    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);*/
    //extracting this logic to world_time.dart...
  }
  */

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
      backgroundColor: Colors.blue[900],
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
