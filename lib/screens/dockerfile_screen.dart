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
          child: Text('Docker App'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(
                FontAwesomeIcons.file,
                color: Colors.black,
              ),
              hintText: 'Enter Url of dockerfile',
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
