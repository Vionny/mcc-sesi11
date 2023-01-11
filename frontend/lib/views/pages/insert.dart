import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/views/pages/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class InsertPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InsertPageState();
  }
}

class InsertPageState extends State<InsertPage> {
  var filmNameController = TextEditingController();
  var filmGenreController = TextEditingController();
  var filmDescController = TextEditingController();
  File? image;

  void _insertOnPressed(BuildContext context) async {
    if (filmNameController.text == "" ||
        filmGenreController.text == "" ||
        filmDescController.text == "" ||
        image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All Fields must be filled!')));
    } else {
      // insert film to DB and then back to home
      String url = "http://10.0.2.2:3000/films";
      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.files
          .add(await http.MultipartFile.fromPath('image', image!.path));
      request.fields["title"] = filmNameController.text;
      request.fields["genre"] = filmGenreController.text;
      request.fields["description"] = filmDescController.text;

      final resp = await request.send();
      if (resp.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (builder) {
          return HomePage();
        }));
      }
    }
  }

  Future pickImage() async {
    // insert image from gallery
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageFile = File(image!.path);
    setState(() {
      this.image = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Insert Film Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Insert Film',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: filmNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Film Name',
                  hintText: 'Enter Film Name',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: filmGenreController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Film Genre',
                  hintText: 'Enter Film Genre',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: filmDescController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Film Desc',
                  hintText: 'Enter Film Description',
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: image != null
                    ? Image.file(
                        image!,
                        width: 50,
                        height: 50,
                      )
                    : const Text('Image Not Picked')),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: ElevatedButton(
                  child: const Text('Pick Image'),
                  onPressed: () => pickImage(),
                )),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: ElevatedButton(
                  child: const Text('Insert'),
                  onPressed: () => _insertOnPressed(context),
                )),
          ],
        ),
      ),
    );
  }
}
