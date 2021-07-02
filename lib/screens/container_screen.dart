import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchr_docker_app/screens/log_screen.dart';
import 'package:matchr_docker_app/utilities/netwotk_helper.dart';

class ContainerScreen extends StatelessWidget {
  static const String id = 'ContainerScreen';
  late final String osName, imageName;
  late final int fromPort, toPort;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Create New Container'),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              child: Image.asset('images/docker-container.png'),
              width: 300,
              height: 300,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.cubes,
                  color: Colors.black,
                ),
                hintText: 'Enter name of your container',
              ),
              onChanged: (value) {
                imageName = value;
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.info,
                  color: Colors.black,
                ),
                hintText: 'Enter name container image',
              ),
              onChanged: (value) {
                osName = value;
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  width: 150.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'From port',
                    ),
                    onChanged: (value) {
                      fromPort = int.parse(value);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  width: 100.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'To port',
                    ),
                    onChanged: (value) {
                      toPort = int.parse(value);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                NetworkHelper networkHelper = NetworkHelper();
                try {
                  var text = await networkHelper.runContainer(
                    osName: osName,
                    imgName: imageName,
                    fromPort: fromPort,
                    toPort: toPort,
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
