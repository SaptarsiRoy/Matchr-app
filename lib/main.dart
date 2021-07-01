import 'package:flutter/material.dart';
import 'package:matchr_docker_app/screens/about_screen.dart';
import 'package:matchr_docker_app/screens/container_screen.dart';
import 'package:matchr_docker_app/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.green.shade200,
        hintColor: Colors.black,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        ContainerScreen.id: (context) => ContainerScreen(),
        AboutScreen.id: (context) => AboutScreen(),
      },
    );
  }
}
