import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchr_docker_app/components/app_drawer.dart';
import 'package:matchr_docker_app/screens/log_screen.dart';
import 'package:matchr_docker_app/utilities/netwotk_helper.dart';

class DockerfileScreen extends StatelessWidget {
  static const String id = 'DockerfileScreen';
  late final String url, imgName, tagName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Center(
          child: Text('Create New Customised Image'),
        ),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('images/dockerfile.png'),
            width: 300,
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
            onChanged: (value) {
              url = value;
            },
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
              hintText: 'Enter Image Name',
            ),
            onChanged: (value) {
              imgName = value;
            },
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
            onChanged: (value) {
              tagName = value;
            },
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                NetworkHelper networkHelper = NetworkHelper();
                try {
                  var text = await networkHelper.createImage(
                    imgUrl: url,
                    imgName: imgName,
                    imgTag: tagName,
                  );
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
