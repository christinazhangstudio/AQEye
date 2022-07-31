import 'package:flutter/material.dart';
import 'package:backyard_hacks/models/forecast_chart_bar.dart';
import 'package:backyard_hacks/service/city_aqi.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Resources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //return to city screen
              Navigator.pop(context);
            }),
        backgroundColor: Colors.blue[900],
        title: const Text('City AQI Data'),
        centerTitle: true,
        elevation: 0,
      ),
      //body: Text(cityInfo['time'])
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        children: <Widget>[
          Card(
            child: Container(
              height: 50,
              //show AQI, TODO: change color?
              color: const Color.fromARGB(255, 180, 180, 180),
              child: const Center(
                child: Text(
                  'Resources',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 20),
          ),
          const Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: AssetImage('assets/EPA_logo.png'),
              fit: BoxFit.fill,
            ),
          ),
          const Card(
            child: Text('ENVIRONMENTAL PROTECTION AGENCY'
                '\n\nPress Inquiries: Members of the press should email press@epa.gov or call 1-202-564-4355. '
                '\n\nMore Contact Information for EPA\'s Office of Transportation and Air Quality: '
                '\nMailing address:'
                '\n\nU.S. Environmental Protection Agency'
                '\nPolicy and Communications, Public Inquiry'
                '\n2000 Traverwood Drive'
                '\nAnn Arbor, MI 48105'),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 20),
          ),
          const Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: AssetImage('assets/USA_gov.png'),
              fit: BoxFit.fill,
            ),
          ),
          const Card(
              child: Text('USA.GOV'
                  '\n\nReport an environmental emergency online through the National Response Center (NRC)'
                  ', or call the NRC at 1-800-424-8802 or 1-202-267-2675. '
                  '\n\nIf you see something that immediately threatens public health or the environment, '
                  'report it as an emergency first, and then report it as a possible violation.  '
                  '\n\nThe Environmental Protection Agency (EPA) explains more about the difference between an '
                  'environmental emergency and an environmental violation.'))
        ],
      ),
    );
  }
}
