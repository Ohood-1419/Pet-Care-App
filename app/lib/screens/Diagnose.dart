// Diagnose

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Diagnose extends StatefulWidget {
  static String? saveData; //= '22/22/2222';

  @override
  _DiagnoseState createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Diagnose your pet eye"),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(children: [
              SizedBox(
                width: 320,
                height: 460,
              ),
              FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () async {
                  var uplimg =
                      await ImagePicker().getImage(source: ImageSource.camera);
                  // controller.getImage(ImageSource.abs);
                },
                color: Colors.purple,
                padding: EdgeInsets.all(5.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.camera_alt, color: Colors.white),
                    Text(
                      "camera",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15,
                height: 20,
              ),
              FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () async {
                  var takeimg =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  // controller.getImage(ImageSource.abs);
                },

                //uploudimag
                color: Colors.purple,
                padding: EdgeInsets.all(5.0),
                child: Column(
                  // Replace with a Row for hrizontal icon + text
                  children: <Widget>[
                    Icon(Icons.album, color: Colors.white),
                    Text(
                      "album",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
