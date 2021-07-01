import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DockerfileScreen extends StatelessWidget {
  static const String id = 'DockerfileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Create New Customised Image'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.network(
                'https://miro.medium.com/max/300/1*7rytrdWuar1l7oaR7CWhXA.jpeg'),
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(
                FontAwesomeIcons.file,
                color: Colors.black,
              ),
              hintText: 'Paste the URL to dockerfile',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.info,
                  color: Colors.black,
                ),
                hintText: 'Enter Image Name'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.addressCard,
                  color: Colors.black,
                ),
                hintText: 'Enter Image Tag'),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
