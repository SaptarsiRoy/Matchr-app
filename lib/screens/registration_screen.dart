import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matchr_docker_app/components/login_button.dart';
import 'package:matchr_docker_app/screens/home_screen.dart';
import 'package:loading_overlay/loading_overlay.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isShowing = false;
  late String email, password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Registration'),
        ),
      ),
      body: LoadingOverlay(
        isLoading: isShowing,
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DOCKER APP',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Courier New',
                        fontSize: 40.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                        style: TextStyle(
                          color: Colors.black,
                        ),
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
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
                            onPressed: () async {
                              try {
                                setState(() {
                                  isShowing = true;
                                });
                                final loggedUser =
                                    await _auth.createUserWithEmailAndPassword(
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
                            }),
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
