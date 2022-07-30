import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class CityAQI {
  String city; //city name for the UI
  String time = ""; //local measurement time
  int aqi = 0; //AQI for this city
  //immutable maps for forecast, date key to avg
  Map<String, int> o3_forecast = {};
  Map<String, int> pm10_forecast = {};
  Map<String, int> pm25_forecast = {};

  CityAQI({required this.city});

  //Future is a temporary value
  Future<void> getData() async {
    //using WAQI to make the request
    try {
      Response response = await get(
        Uri.parse(
            'https://api.waqi.info/feed/$city/?token=adaf8f3d4f7256871de1f5996d1e3943b37356b8'), /*headers: {"X-Api-Key": "Aj0xwxggb5UxaCk/Fd8WEw==lwHDhAzKoznrMp3l"}*/
      );
      Map data = jsonDecode(response.body);
      //uncomment below line to see what this response contains
      //print(data);

      //get properties from data
      city = city;
      time = data['data']['time']['s'];
      aqi = data['data']['aqi'];

      //populate the o3_forecast map
      for (Map forecastObject in data['data']['forecast']['daily']['o3']) {
        //grab day and avg for each day
        o3_forecast.putIfAbsent(
            forecastObject['day'], () => forecastObject['avg']);
      }
      //populate the pm10_forecast map
      for (Map forecastObject in data['data']['forecast']['daily']['pm10']) {
        //grab day and avg for each day
        pm10_forecast.putIfAbsent(
            forecastObject['day'], () => forecastObject['avg']);
      }
      //populate the pm25_forecast map
      for (Map forecastObject in data['data']['forecast']['daily']['pm25']) {
        //grab day and avg for each day
        pm25_forecast.putIfAbsent(
            forecastObject['day'], () => forecastObject['avg']);
      }

      //String datetime = data['datetime'];
      //String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(offset);

      //create DateTime object
      //DateTime now = DateTime.parse(datetime);
      //now = now.add(Duration(hours: int.parse(offset)));

      //set daytime
      //isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      //set the time property
      //time = now.toString();
      //time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error: $e');
      time = 'Could not fetch data. Check API token?';
    }
  }
}
