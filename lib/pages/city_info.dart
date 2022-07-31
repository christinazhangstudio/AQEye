// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:backyard_hacks/models/forecast_chart_bar.dart';
import 'package:backyard_hacks/service/city_aqi.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CityInfo extends StatefulWidget {
  @override
  _CityInfoState createState() => _CityInfoState();
}

class _CityInfoState extends State<CityInfo> {
  //receive city info from API call (passed in as argument from loading screen)
  Map cityInfo = {};

  @override
  Widget build(BuildContext context) {
    cityInfo = cityInfo.isNotEmpty
        ? cityInfo
        : ModalRoute.of(context)!.settings.arguments as Map;

    Color color = Colors.white;
    IconData face = FontAwesomeIcons.faceFrown;
    int numval = 0;
//color determiner
    if (cityInfo['aqi'] > 20 && cityInfo['aqi'] < 50) {
      color = Colors.yellow;
      face = FontAwesomeIcons.faceMeh;
      numval = 2;
    }
    if (cityInfo['aqi'] >= 50) {
      color = Colors.red;
      face = FontAwesomeIcons.faceAngry;
      numval = 3;
    }
    if (cityInfo['aqi'] <= 20) {
      color = Colors.green;
      face = FontAwesomeIcons.faceSmile;
      numval = 1;
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //return to map screen
              Navigator.pop(context);
            }),
        backgroundColor: Color.fromARGB(255, 16, 137, 146),
        title: Text('City AQI Data'),
        centerTitle: true,
        elevation: 0,
      ),
      //body: Text(cityInfo['time'])
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        children: <Widget>[
          Card(
            child: ListTile(
                //show AQI
                title: Text(
                  cityInfo['city'],
                  style: TextStyle(fontSize: 30),
                ),
                leading: const Icon(
                  FontAwesomeIcons.city,
                  color: Color.fromARGB(255, 16, 137, 146),
                )),
          ),
          Card(
            color: color,
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Icon(
                  //change this dynamically
                  face,
                  //FontAwesomeIcons.faceMeh,

                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 100.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Text(
                  'AQI: ${cityInfo['aqi']}',
                  style: TextStyle(fontSize: 30),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
              ],
            ),
          ),
          Card(
            child: Container(
              height: 30,
              //show AQI, TODO: change color?
              color: Color.fromARGB(255, 180, 180, 180),
              child: Center(
                child: Text('Updated ${cityInfo['time']}'),
              ),
            ),
          ),
          Card(
            child: SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Respond to button press
                  Navigator.pushNamed(context, '/resources');
                },
                icon: const Icon(FontAwesomeIcons.bullhorn, size: 30),
                label: const Text(
                  "Report concern or find resources",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                'O3 levels',
                style: TextStyle(
                    fontSize: 15,
                    background: Paint()
                      ..strokeWidth = 20.0
                      ..color = Color.fromARGB(255, 174, 174, 174)
                      ..style = PaintingStyle.stroke
                      ..strokeJoin = StrokeJoin.round),
              ),
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: (cityInfo['o3_forecast'] as Map)
                  .entries
                  .map((entry) => Bar(
                      entry.value,
                      entry.value / 100.0,
                      (entry.key).split('-')[1] +
                          '/' +
                          (entry.key).split('-')[2]))
                  .toList(),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                'PM10 levels',
                style: TextStyle(
                    fontSize: 15,
                    background: Paint()
                      ..strokeWidth = 20.0
                      ..color = Color.fromARGB(255, 174, 174, 174)
                      ..style = PaintingStyle.stroke
                      ..strokeJoin = StrokeJoin.round),
              ),
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: (cityInfo['pm10_forecast'] as Map)
                  .entries
                  .map((entry) => Bar(
                      entry.value,
                      entry.value / 100.0,
                      (entry.key).split('-')[1] +
                          '/' +
                          (entry.key).split('-')[2]))
                  .toList(),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                'PM2.5 levels',
                style: TextStyle(
                    fontSize: 15,
                    background: Paint()
                      ..strokeWidth = 20.0
                      ..color = Color.fromARGB(255, 174, 174, 174)
                      ..style = PaintingStyle.stroke
                      ..strokeJoin = StrokeJoin.round),
              ),
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: (cityInfo['pm25_forecast'] as Map)
                  .entries
                  .map((entry) => Bar(
                      entry.value,
                      entry.value / 100.0,
                      (entry.key).split('-')[1] +
                          '/' +
                          (entry.key).split('-')[2]))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
