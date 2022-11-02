import 'package:flutter/material.dart';
import 'package:timezoneapp/pages/home.dart';
import 'package:timezoneapp/pages/loading.dart';
import 'package:timezoneapp/pages/choose_location.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',

  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/choose_location':(context) => ChooseLocation()  
  },

));