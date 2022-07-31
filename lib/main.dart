import 'package:flutter/material.dart';
import 'package:backyard_hacks/pages/city_info.dart';
import 'package:backyard_hacks/pages/home.dart';
import 'package:backyard_hacks/pages/loading.dart';
import 'package:backyard_hacks/pages/resources.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          //'/loading': (context) => Loading(),
          '/city_info': (context) => CityInfo(),
          '/resources': (context) => Resources(),
        },
        onGenerateRoute: (RouteSettings settings) {
          print('receiving argument to load ${settings.arguments}');
          var routes = <String, WidgetBuilder>{
            '/loading': (context) => Loading(settings.arguments as Map),
          };
          WidgetBuilder? builder = routes[settings.name];
          return MaterialPageRoute(builder: (context) => builder!(context));
        },
      ),
    );
