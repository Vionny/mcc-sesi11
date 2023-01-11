import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/views/pages/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  var ctrlUsername = TextEditingController();
  var ctrlPassword = TextEditingController();

  void _onPressedLogin(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
      return LoginPage();
    }));
  }

  void _onPressed(BuildContext context) async {
    if (ctrlUsername.text == "" || ctrlPassword.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Username and Password must not be Empty')));
    } else {
      // Register Here

      // Go to Login Page

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register',
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
                  child: const Text('Register'),
                  onPressed: () => _onPressed(context),
                )),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextButton(
                onPressed: () => _onPressedLogin(context),
                child: const Text('Already have an account, login here!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
