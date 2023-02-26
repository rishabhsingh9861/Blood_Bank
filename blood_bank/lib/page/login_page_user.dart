import 'package:flutter/material.dart';

import 'package:flutter_cataloge/utilits/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Material(
          color: Colors.black,
          child: Column(children: [
            Image.asset(
              "assets/images/blood_login_page_2.jpg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "WELCOME TO LIFE",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              child: Text(
                "REGISTER",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, MyRoutes.registerRoute);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, MyRoutes.loginclickRoute);
              },
            ),
          ])),
    );
  }
}
