import 'package:flutter/material.dart';
import 'package:backyard_hacks/pages/choose_location.dart';
import 'package:backyard_hacks/pages/home.dart';
import 'package:backyard_hacks/pages/loading.dart';
import 'package:backyard_hacks/pages/choose_location.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
