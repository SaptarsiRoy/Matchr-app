import 'package:flutter/material.dart';
import 'package:matchr_docker_app/components/login_button.dart';
import 'package:matchr_docker_app/screens/home_screen.dart';
import 'package:matchr_docker_app/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Login'),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              width: 300,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'DOCKER APP',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Courier New',
                        fontSize: 30.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset('images/docker logo.png'),
                    ),
                    width: 1500,
                    height: 150,
                  ),
                  SizedBox(
                    height: 10,
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
                      LoginButton(
                        buttonTitle: 'Login',
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.id);
                        },
                      ),
                      LoginButton(
                        buttonTitle: 'Register Here',
                        onPressed: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
