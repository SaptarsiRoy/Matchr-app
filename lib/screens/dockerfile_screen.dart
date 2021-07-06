import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchr_docker_app/components/app_drawer.dart';
import 'package:matchr_docker_app/screens/log_screen.dart';
import 'package:matchr_docker_app/utilities/netwotk_helper.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DockerfileScreen extends StatefulWidget {
  static const String id = 'DockerfileScreen';

  @override
  _DockerfileScreenState createState() => _DockerfileScreenState();
}

class _DockerfileScreenState extends State<DockerfileScreen> {
  late String url, imgName, tagName;
  bool isShowing = false;
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
          child: Text('Create New Customised Image'),
        ),
      ),
      drawer: AppDrawer(),
      body: LoadingOverlay(
        isLoading: isShowing,
        child: ListView(children: [
          Column(
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
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    FontAwesomeIcons.file,
                    color: Colors.black,
                  ),
                  hintText: 'Paste the URL to dockerfile',
                ),
                onChanged: (value) {
                  String userUrl = value;
                  List<String> splitUrl = userUrl.split('/');
                  url = splitUrl[5];
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(
                  color: Colors.black,
                ),
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
                style: TextStyle(
                  color: Colors.black,
                ),
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
                    setState(() {
                      isShowing = true;
                    });
                    NetworkHelper networkHelper = NetworkHelper();
                    try {
                      var text = await networkHelper.createImage(
                        fieldId: url,
                        imgName: imgName,
                        tagName: tagName,
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
        ]),
      ),
    );
  }
}
