import 'package:flutter/material.dart';
import 'package:matchr_docker_app/screens/about_screen.dart';
import 'package:matchr_docker_app/screens/container_screen.dart';
import 'package:matchr_docker_app/screens/dockerfile_screen.dart';
import 'package:matchr_docker_app/screens/home_screen.dart';
import 'package:matchr_docker_app/screens/log_screen.dart';
import 'package:matchr_docker_app/screens/login_screen.dart';
import 'package:matchr_docker_app/screens/registration_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.green.shade200,
        hintColor: Colors.black45,
      ),
      initialRoute: AboutScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ContainerScreen.id: (context) => ContainerScreen(),
        DockerfileScreen.id: (context) => DockerfileScreen(),
        AboutScreen.id: (context) => AboutScreen(),
        LogScreen.id: (context) => LogScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
