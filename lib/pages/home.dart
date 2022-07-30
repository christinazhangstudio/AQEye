import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //represents CityAQI data
  //Map data = {};
  @override
  Widget build(BuildContext context) {
    //receive arguments from setupCityAQI() in loading.dart
    /*data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;*/
    //print(data);

    //set background
    /*String bgImage = data['isDayTime'] ? 'sunrise.jpeg' : 'night.jpeg';
    //for bar at the very top (and possibly bottom) strip
    Color bgColor = data['isDayTime'] ? Colors.orangeAccent : Colors.blueGrey;
    Color? textColor1 = data['isDayTime'] ? Colors.grey[800] : Colors.grey[300];
    Color textColor2 = data['isDayTime'] ? Colors.black : Colors.white;*/

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("AQI Visualizer"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.magnifyingGlass),
              onPressed: () {
                //
              }),
        ],
      ),
      body: FlutterMap(
          options: MapOptions(
            center: LatLng(30.0, -118.0),
            zoom: 3.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/christinazhang19/cl68879hi000b15qs1jpny21a/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiY2hyaXN0aW5hemhhbmcxOSIsImEiOiJjbDY4NGowODYzcW41M2NvMTBtendvaTl0In0.HpG_pxEApPDpiZhg7vJ34A",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoiY2hyaXN0aW5hemhhbmcxOSIsImEiOiJjbDY4NnNicGUzc3MyM2RvMXhubm9nMmRlIn0.Lg7WuijnKA710yfD65adUw',
                'id': 'mapbox.mapbox-streets-v8',
              },
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(30.0, -118.0),
                  builder: (ctx) => Container(
                    child: IconButton(
                      //send to screen for this city that displays specific information
                      //don't need to send back data from that screen to this one
                      //do need to pass this city...
                      onPressed: () {
                        Navigator.pushNamed(context, '/loading',
                            arguments: {'city': 'Houston'});
                      },
                      icon: const Icon(
                        FontAwesomeIcons.locationDot,
                        color: Color(0xff6200ee),
                        size: 45.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
