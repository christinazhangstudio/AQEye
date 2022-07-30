import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //return to map screen
              Navigator.pop(context);
            }),
        backgroundColor: Colors.blue[900],
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
              ),
              leading: const CircleAvatar(
                  //backgroundImage:
                  //    AssetImage('assets/${locations[index].flag}'),
                  ),
            ),
          ),
          /*Card(
            child: Container(
              height: 200,
              //show AQI, TODO: change color?
              color: Colors.amber,
              child: Text(
                'AQI: ${cityInfo['aqi']}',
              ),
            ),
          ),*/
          Card(
            color: Colors.amber,
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                const Icon(
                  //change this dynamically
                  FontAwesomeIcons.faceSmile,
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
        ],
      ),
    );
  }
}
