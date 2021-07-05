import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchr_docker_app/components/container_button.dart';
import 'package:matchr_docker_app/screens/about_screen.dart';
import 'package:matchr_docker_app/screens/container_screen.dart';
import 'package:matchr_docker_app/screens/dockerfile_screen.dart';
import 'package:matchr_docker_app/screens/log_screen.dart';
import 'package:matchr_docker_app/components/app_drawer.dart';
import 'package:matchr_docker_app/utilities/netwotk_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title: Center(
          child: Text('Docker App'),
        ),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            width: 700,
            height: 50,
            child: Row(
              children: <Widget>[
                Center(
                  child: Text(
                    ' Want help in how to use the app? Check out',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 17,
                    ),
                  ),
                ),
                TextButton(
                  child: Text(
                    'Abouts',
                    style: TextStyle(
                      decorationThickness: 3,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AboutScreen.id);
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Hero(
              tag: 'logo',
              child: Image.asset('images/docker logo.png'),
            ),
            alignment: Alignment.topCenter,
            width: 500,
            height: 200,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ContainerButton(
                buttonTitle: 'Create A Container',
                onPressed: () {
                  Navigator.pushNamed(context, ContainerScreen.id);
                },
              ),
              ContainerButton(
                buttonTitle: 'Create Cutomised Image',
                onPressed: () {
                  Navigator.pushNamed(context, DockerfileScreen.id);
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ContainerButton(
                buttonTitle: 'List All Containers',
                onPressed: () async {
                  NetworkHelper networkHelper = NetworkHelper();
                  try {
                    var text = await networkHelper.getContainers();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogScreen(
                          logOutput: text,
                        ),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
