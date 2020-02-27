import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File file;

  void _choose() async {
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() async {
      file = await ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  // void _upload() {
  //   if (file == null) return;
  //   String base64Image = base64Encode(file.readAsBytesSync());
  //   String fileName = file.path.split("/").last;

  //   http.post(phpEndPoint, body: {
  //     "image": base64Image,
  //     "name": fileName,
  //   }).then((res) {
  //     print(res.statusCode);
  //   }).catchError((err) {
  //     print(err);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Center(
    //     child: Text("Home"),
    //   ),
    // );
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _choose,
              child: Text('Choose Image'),
            ),
            SizedBox(width: 10.0),
            RaisedButton(
              // onPressed: ,
              child: Text('Upload Image'),
            )
          ],
        ),
        file == null ? Text('No Image Selected') : Image.file(file)
      ],
    );
  }
}
