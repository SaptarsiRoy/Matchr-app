import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:matchr_docker_app/components/login_button.dart';
import 'package:matchr_docker_app/screens/home_screen.dart';
import 'package:matchr_docker_app/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email, password;
  bool isShowing = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Login'),
        ),
      ),
      body: LoadingOverlay(
        isLoading: isShowing,
        child: ListView(
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
                        email = value;
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
                        password = value;
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
                          onPressed: () async {
                            try {
                              setState(() {
                                isShowing = true;
                              });
                              final loggedUser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (loggedUser != null) {
                                Navigator.pushNamed(context, HomeScreen.id);
                                setState(() {
                                  isShowing = false;
                                });
                              }
                            } catch (e) {
                              print(e);
                            }
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
      ),
    );
  }
}
