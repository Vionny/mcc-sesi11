import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/models/films.dart';
import 'package:frontend/views/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class DetailPage extends StatefulWidget {
  int filmId;
  String filmName;
  String filmGenre;
  String filmDesc;

  DetailPage(
      {super.key,
      required this.filmId,
      required this.filmName,
      required this.filmGenre,
      required this.filmDesc});

  @override
  State<StatefulWidget> createState() {
    return DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> {
  var filmNameController = TextEditingController();
  var filmGenreController = TextEditingController();
  var filmDescController = TextEditingController();
  File? image;

  late Future<Film> film;

  Future<Film> fetchFilm() async {
    String url = "http://10.0.2.2:3000/films/get-film/${widget.filmId}";
    // print("url : " + url);
    var resp = await http.get(Uri.parse(url));
    print(resp);
    var json = jsonDecode(resp.body);
    Film film = Film.fromJson(json);
    return film;
  }

  @override
  void initState() {
    super.initState();

    // fetch film
    film = fetchFilm();

    filmNameController.text = widget.filmName;
    filmGenreController.text = widget.filmGenre;
    filmDescController.text = widget.filmDesc;
  }

  void _updateOnPressed(BuildContext context, int id) async {
    if (filmNameController.text == "" ||
        filmGenreController.text == "" ||
        filmDescController.text == "" ||
        image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All Fields must be filled!')));
    } else {
      // UPDATE FILM HERE
      String url = "http://10.0.2.2:3000/films";
      var request = http.MultipartRequest("PUT", Uri.parse(url));
      request.files
          .add(await http.MultipartFile.fromPath('image', image!.path));
      request.fields["id"] = widget.filmId.toString();
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
          title: const Text('Detail and Update Page'),
        ),
        body: FutureBuilder(
            future: film,
            builder: (context, snapshot) {
              var data = snapshot.data;
              print(data);
              if (data != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Update Film',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: image != null
                              ? Image.file(
                                  image!,
                                  width: 50,
                                  height: 50,
                                )
                              : Image.network(data.image,
                                  width: 50, height: 50)),
                      Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: ElevatedButton(
                            child: const Text('Pick Image'),
                            onPressed: () => pickImage(),
                          )),
                      Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: ElevatedButton(
                            child: const Text('Update'),
                            onPressed: () =>
                                _updateOnPressed(context, widget.filmId),
                          )),
                    ],
                  ),
                );
              }
              return const Text('Loading');
            }));
  }
}
