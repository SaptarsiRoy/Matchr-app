import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerScreen extends StatelessWidget {
  static const String id = 'ContainerScreen';
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
              child: Image.network(
                  'https://www.mobilise.cloud/wp-content/uploads/2021/02/Alternatives-to-Docker-Container-1.png'),
              //alignment: Alignment.center,
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
                //labelText: 'contName',
              ),
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
