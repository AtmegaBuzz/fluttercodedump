import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:core';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  Map section = {
    "morning":"assets/images/morning1.jpg",
    "afternoon":"assets/images/afternoon.jpg",
    "evening":"assets/images/evening.jpg",
    "night":"assets/images/night.jpg",
  };
  

  int hour = 0;
  int minute = 0;
  String time = "";
  bool is_am = false;
  String location = "Kolkata";
  bool error = false;
  String section_half = "assets/images/morning1.jpg";

  void getTime() async {

    try{
      
      Response resp = await get(Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Kolkata"));
      Map data = jsonDecode(resp.body); 

      DateTime now = DateTime.parse(data["datetime"]);
      String offset = data["utc_offset"];

      if(offset[0]=='+'){
        now = now.add(Duration(hours: int.parse(offset.substring(1,3)),minutes: int.parse(offset.substring(4,6))));
      }
      else{
        now = now.subtract(Duration(hours: int.parse(offset.substring(1,3)),minutes: int.parse(offset.substring(4,6))));
      }

      hour = now.hour;
      minute = now.minute;
      time = DateFormat.jm().format(now);
      

    }
    catch (e){
      error = true;
    }
  
    if(!error){
    
      if(hour>=1 && hour<=6){
        section_half = section["night"];
      }
      else if(hour>6 && hour<=11){
        section_half = section["morning"];
      }
      else if(hour>11 && hour<=16){
        section_half = section["evening"];
      }
      else if(hour>16 && hour<=24){
        section_half = section["evening"];
      }
      else{
        print("error");
      }
    }
    
    Navigator.pushReplacementNamed(context, '/home',arguments: {
        "time":time,
        "error":error,
        "is_am":is_am,
        "location":location,
        "section_half": section_half
    });  

  }

  @override
  void initState(){
    super.initState();
    getTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 80.0,
            ),
      ),
    );
  }
}