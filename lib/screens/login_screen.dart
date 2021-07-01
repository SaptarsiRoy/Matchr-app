import 'package:flutter/material.dart';
import 'package:matchr_docker_app/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.network('https://logodix.com/logo/826727.png'),
                width: 200,
                height: 200,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  // email = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  // password = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(
                      10.0,
                    ),
                    child: Material(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: MaterialButton(
                        minWidth: 50,
                        height: 40,
                        child: Text('Register Here'),
                        onPressed: () async {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(
                      10.0,
                    ),
                    child: Material(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: MaterialButton(
                        minWidth: 50,
                        height: 40,
                        child: Text('Register Here'),
                        onPressed: () async {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
