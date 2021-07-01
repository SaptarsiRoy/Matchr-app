import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matchr_docker_app/components/login_button.dart';
import 'package:matchr_docker_app/screens/home_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = 'RegistrationScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Registration'),
        ),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset('images/docker logo.png'),
                ),
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: TextField(
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
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
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
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  LoginButton(
                      buttonTitle: 'Login',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  LoginButton(
                      buttonTitle: 'Register Now',
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
