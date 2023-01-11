import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/films.dart';
import 'package:frontend/views/pages/detail.dart';
import 'package:frontend/views/pages/insert.dart';
import 'package:frontend/views/pages/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late Future<List<Film>> filmList;

  Future<List<Film>> fetchFilm() async {
    final prefs = await SharedPreferences.getInstance();

    String url = "http://10.0.2.2:3000/films?token=${prefs.getString("token")}";
    var resp = await http.get(Uri.parse(url));
    var result = jsonDecode(resp.body);
    print("ganteng");
    List<Film> filmList = [];
    for (var i in result) {
      Film newFilm = Film.fromJson(i);
      filmList.add(newFilm);
    }
    return filmList;
  }

  Future onPressDelete(int id) async {
    String url = "http://10.0.2.2:3000/films";
    var resp = await http.delete(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'id': id,
        }));
    if (resp.statusCode == 200) {
      setState(() {
        filmList = fetchFilm();
      });
    }
  }

  void detailPressed(int id, String title, String genre, String description) {
    var navigator = Navigator.of(context);
    // print(id);
    // print(title);
    // print(genre);
    // print(description);
    navigator.push(MaterialPageRoute(builder: (builder) {
      return DetailPage(
        filmId: id,
        filmName: title,
        filmGenre: genre,
        filmDesc: description,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    filmList = fetchFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            PopupMenuButton(
              onSelected: (value) async {
                var navigator = Navigator.of(context);

                if (value == "insert menu") {
                  navigator.push(MaterialPageRoute(builder: (builder) {
                    return InsertPage();
                  }));
                } else if (value == "logout") {
                  // remove token from shared pref
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('token');

                  // google Sign In Logout

                  navigator
                      .pushReplacement(MaterialPageRoute(builder: (builder) {
                    return LoginPage();
                  }));
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: "insert menu",
                  child: Text('Insert Film'),
                ),
                const PopupMenuItem(
                  value: "logout",
                  child: Text('Logout'),
                ),
              ],
            )
          ],
        ),
        body: FutureBuilder(
          future: filmList,
          builder: (context, snapshot) {
            var data = snapshot.data;

            if (data != null) {
              return ListView(
                  children: data
                      .map((e) => GestureDetector(
                            onTap: () => detailPressed(
                                e.id, e.title, e.genre, e.description),
                            child: ListTile(
                              leading: Image.network(e.image),
                              title: Text(e.title),
                              subtitle: Text(e.genre),
                              trailing: ElevatedButton(
                                onPressed: () => onPressDelete(e.id),
                                child: Text('DELETE'),
                              ),
                            ),
                          ))
                      .toList());
            }
            return const Text('Loading');
          },
        ));
  }
}
