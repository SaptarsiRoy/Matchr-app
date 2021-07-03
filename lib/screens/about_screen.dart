import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchr_docker_app/components/app_drawer.dart';

const kAboutTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Courier New',
  color: Colors.white,
);

class AboutScreen extends StatelessWidget {
  static const String id = 'AboutScreen';
  final List<Text> _aboutText = [
    Text(
      'This app is used to run remote docker commands inside a virtual machine running in AWS.',
      style: kAboutTextStyle,
    ),
    Text('\n\n'),
    Text(
      'To create a docker container using pre-existing docker image, the user needs to click on "Create new container" button, input the desired values for the same and click on Create. The app will redirect itself to the terminal screen for the output.',
      style: kAboutTextStyle,
    ),
    Text('\n\n'),
    Text(
      'This app also allows its users to create a customised docker image and tag it. For the same, users need to click on "Create new image" button.',
      style: kAboutTextStyle,
    ),
    Text(
      'On redirection to the significant screen, the user needs to enter the accessible URL of the Dockerfile uploaded to DRIVE/CLOUD STORAGE along with the image name and its tag.',
      style: kAboutTextStyle,
    ),
    Text(
      'On clicking the create button, the terminal output screen would be generated.',
      style: kAboutTextStyle,
    ),
    Text('\n\n'),
    Text(
      'To list down all the containers that are running on live server, user needs to just click on "List All Containers" button and look for in the output screen.',
      style: kAboutTextStyle,
    ),
    Text('\n\n'),
    Text(
      'The app can be used either as a playgroupnd application for Docker, or just to access Docker in an user-friendly way!\n\nHAPPY DOCKER! :)',
      style: kAboutTextStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text('How to Use?'),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                _aboutText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
