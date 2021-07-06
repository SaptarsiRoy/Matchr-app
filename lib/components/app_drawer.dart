import 'package:flutter/material.dart';
import 'package:matchr_docker_app/screens/container_screen.dart';
import 'package:matchr_docker_app/screens/dockerfile_screen.dart';
import 'package:matchr_docker_app/screens/home_screen.dart';
import 'package:matchr_docker_app/screens/log_screen.dart';
import 'package:matchr_docker_app/utilities/netwotk_helper.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.greenAccent,
          ),
          child: Text(
            'Docker App',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName(HomeScreen.id));
          },
        ),
        ListTile(
          title: Text('Create New Container'),
          onTap: () {
            Navigator.pushNamed(context, ContainerScreen.id);
          },
        ),
        ListTile(
          title: Text('Create Customised Image'),
          onTap: () {
            Navigator.pushNamed(context, DockerfileScreen.id);
          },
        ),
        ListTile(
          title: Text('List All Containers'),
          onTap: () async {
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
    ));
  }
}
