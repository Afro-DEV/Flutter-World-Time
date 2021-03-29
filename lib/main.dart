import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/", //overides loading and makes home the first thing that loads up with the app
    routes: {
    "/": (context) => Loading(), //Loads loading widget as the app opens up
      "/home": (context) => Home(),
      "/location":(context) => ChooseLocation(),
    },
  ));
}


