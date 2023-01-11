import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/views/pages/home.dart';
import 'package:frontend/views/pages/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var ctrlUsername = TextEditingController();
  var ctrlPassword = TextEditingController();

  void _onPressedLogin(BuildContext context) async {
    if (ctrlUsername.text == "" || ctrlPassword.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Username and Password must not be Empty')));
    } else {
      String url = "http://10.0.2.2:3000/users/auth/login";
      final resp = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
              {"username": ctrlUsername.text, "password": ctrlPassword.text}));
      if (resp.body.isNotEmpty) {
        print("masuk pak eko");
        final prefs = await SharedPreferences.getInstance();
        User authUser = User.fromJson(jsonDecode(resp.body));
        await prefs.setString("token", authUser.token);
        print(authUser.username);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (builder) {
          return HomePage();
        }));
      }

      // Simpan di shared pref

    }
  }

  Future _onPressedGmail(BuildContext context) async {
    // Google Sign In
  }

  void _onPressedRegister(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
      return RegisterPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                controller: ctrlUsername,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter Username',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: ctrlPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () => _onPressedLogin(context),
                )),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
                child: ElevatedButton(
                  child: const Text('Login With GMail'),
                  onPressed: () => _onPressedGmail(context),
                )),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextButton(
                onPressed: () => _onPressedRegister(context),
                child: const Text('Didn\'t have an account, register here!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
