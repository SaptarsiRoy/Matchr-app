import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String id = 'AboutScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('How to Use?'),
        ),
      ),
      body: Center(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.black,
          child: Text(
            'This app is used to run remote docker commands inside a VM running in AWS.\n\nTo create a docker container using pre-existing docker image, the user needs to click on "Create new container" button, input the desired values for the same and click on Create. The app will redirect itself to the terminal screen for the output.\n\nThis app also allows its users to create a customised docker image and tag it. For the same, users need to click on "Create new image". On redirection to the significant screen, the user needs to enter the accessible URL of the Dockerfile uploaded to DRIVE/CLOUD STORAGE along with the image name and its tag. On clicking the create button, the terminal output screen would be generated.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
              fontFamily: 'Courier New',
            ),
          ),
        ),
      ),
    );
  }
}
