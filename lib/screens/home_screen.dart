import 'package:flutter/material.dart';
import 'package:matchr_docker_app/components/container_button.dart';
import 'package:matchr_docker_app/screens/about_screen.dart';
import 'package:matchr_docker_app/screens/container_screen.dart';
import 'package:matchr_docker_app/screens/dockerfile_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Docker App'),
        ),
      ),
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
            child: Image.network(
                'https://developers.redhat.com/sites/default/files/styles/article_feature/public/blog/2014/05/homepage-docker-logo.png?itok=zx0e-vcP'),
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
                buttonTitle: 'Create a Container',
                onPressed: () {
                  Navigator.pushNamed(context, ContainerScreen.id);
                },
              ),
              ContainerButton(
                buttonTitle: 'Upload a Dockerfile',
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
                buttonTitle: 'List all containers',
                onPressed: () {
                  Navigator.pushNamed(context, ContainerScreen.id);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
