import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchr_docker_app/screens/log_screen.dart';
import 'package:matchr_docker_app/components/app_drawer.dart';
import 'package:matchr_docker_app/utilities/netwotk_helper.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ContainerScreen extends StatefulWidget {
  static const String id = 'ContainerScreen';

  @override
  _ContainerScreenState createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  late String osName, imageName, toPort, fromPort;
  bool isShowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Create New Container'),
        ),
      ),
      drawer: AppDrawer(),
      body: LoadingOverlay(
        isLoading: isShowing,
        child: ListView(
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
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    FontAwesomeIcons.cubes,
                    color: Colors.black,
                  ),
                  hintText: 'Enter name of your container',
                ),
                onChanged: (value) {
                  osName = value;
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    FontAwesomeIcons.info,
                    color: Colors.black,
                  ),
                  hintText: 'Enter name container image',
                ),
                onChanged: (value) {
                  imageName = value;
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
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'From port',
                      ),
                      onChanged: (value) {
                        fromPort = value;
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
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'To port',
                      ),
                      onChanged: (value) {
                        toPort = value;
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
                  setState(() {
                    isShowing = true;
                  });
                  NetworkHelper networkHelper = NetworkHelper();
                  try {
                    var text = await networkHelper.runContainer(
                      osName: osName,
                      imageName: imageName,
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
                    setState(() {
                      isShowing = false;
                    });
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
      ),
    );
  }
}
