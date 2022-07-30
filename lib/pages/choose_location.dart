import 'package:flutter/material.dart';
import 'package:backyard_hacks/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<CityAQI> locations = [
    CityAQI(city: 'London'),
    CityAQI(city: 'Athens'),
    //add more maybe...
  ];

  void updateTime(index) async {
    CityAQI instance = locations[index];
    await instance.getData();
    //navigate to home screen
    Navigator.pop(context, {
      'city': instance.city,
      //'location': instance.location,
      //'flag': instance.flag,
      //'time': instance.time,
      //'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(
                    locations[index].city,
                  );
                  updateTime(index);
                },
                title: Text(
                  locations[index].city,
                ),
                leading: CircleAvatar(
                    //backgroundImage:
                    //    AssetImage('assets/${locations[index].flag}'),
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
