import 'package:flutter/material.dart';



void main() => runApp(MaterialApp(
  home: Login(),
));


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool seePassword = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          
          SizedBox(height: 70.0,),

          Center(
            child: Text(
              "Instagram",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          SizedBox(height: 70,),

          ElevatedButton.icon(
            onPressed: ()=>1,
            icon: Icon(
                Icons.facebook,
                color: Colors.white,
                size: 35,
              ),
            label: Text(
              "Continue with Facebook",
              style: TextStyle(fontSize: 20),
              ),

            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(55, 6, 55, 6),
            ),
            
          ),

          SizedBox(height: 50,),

          Padding(
            padding: const EdgeInsets.fromLTRB(55, 0, 55, 0),
            child: Divider(height: 1,color: Colors.grey[500],),
          ),

          
          SizedBox(height: 30,),

          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: Column(children: [
              
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone number, username or email",
                  suffixIcon: IconButton(
                      onPressed: () {
                        usernameController.clear();
                      },
                      icon: Icon(Icons.clear),
                      iconSize: 25,
                    )
                ),
              ),

              SizedBox(height: 5,),

              TextField(
                controller: passwordController,
                obscureText: !seePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          seePassword = !seePassword;
                        });
                      },
                      icon: seePassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                      iconSize: 25,
                    )
                ),
              ),

            
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: ()=>1,
                  child: Text("Forgot password?"),
                ),
              ),

            ]),
          ),

          ElevatedButton(
              onPressed: ()=>{print("${usernameController.text} ${passwordController.text}")},
              child: Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(150, 0, 150, 0)
              ),
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Don't have an account?"),
              TextButton(
                onPressed: ()=>1,
                child: Text(
                  "Sign up"
                )
              )
            ],)
          

      ]),
    );
  }
}