import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:core';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: data["error"] ? AssetImage('assets/images/morning1.jpg') : AssetImage(data['section_half']),fit: BoxFit.fill),
        ),

        child: Column(
          children: [
            
            SizedBox(height: 150,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircleAvatar(child: Image.asset("assets/images/morning1.jpg",fit: BoxFit.cover,),radius: 25,),
              SizedBox(width: 10,),
              Text(
                "${data["location"]}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                )
            ],),

            SizedBox(height: 25,),

            data["error"]
            ? Text(
              "some error occured",
              style: TextStyle(
                fontSize: 25,
                color: Colors.red
              ),
            )
            : Text(
              "${data['time']}",
              style: TextStyle(
                fontSize: 75,
                color: Colors.white
              ),
            ),

            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: (() => 1), 
              child: Text(
                "Location",
                style: TextStyle(
                  fontSize: 20
                ),
                )
            )

        ],),

      ) 
        
    );
  }
}