import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: NinjaCard(),
  ),
);




class NinjaCard extends StatefulWidget{

  @override
  _NinjaCardState createState() => _NinjaCardState();

}


class _NinjaCardState extends State<NinjaCard>{

  int ninja_level = 0;
  final _textcontroller = TextEditingController();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Ninja App"),
        backgroundColor: Colors.red[600],
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            
            SizedBox(height: 50,),

            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.jpeg'),
                radius: 50,
              ),
            ),
            // line
            Divider(
              height: 95,
              color: Colors.grey[700],
            ),
            
            // name 
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20
                  ),
                ),
                
                SizedBox(height: 15,),

                Text(
                  "Swapnil Shinde",
                  style: TextStyle(
                    color: Colors.amber[400],
                    fontSize: 40
                  ),
                  ),
              ]),
            ),
            
            SizedBox(height: 40,),
            // current ninga level
            Container(

                margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    "Current Ninja Level",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 15,),

                  Text(
                    "${ninja_level}",
                    style: TextStyle(
                      color: Colors.amber[400],
                      fontSize: 40
                    ),
                  ),
                ]),
            ),

            // email address
            Container(
              margin: EdgeInsets.fromLTRB(30, 40, 0, 0),
              child: Row(
                children: [
                Icon(
                  Icons.email,
                  size: 30,
                  color: Colors.amber[400],
                ),

                SizedBox(width: 7,),

                Text(
                  "swapnilshinde938@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),

              ]),
            ),
            SizedBox(height: 30,),

            TextField(
              decoration: InputDecoration(
                errorText: "Hello",
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
                suffix: IconButton(
                  onPressed: () { 
                    _textcontroller.clear();
                  },
                  icon: Icon(Icons.clear),
                )
              ),
              controller: _textcontroller,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 10,

            ),

          ],

        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {setState(() {
          ninja_level+=1;
        });},
        child: Icon(Icons.add,size: 30,),
      ),
    );
  } 

}
