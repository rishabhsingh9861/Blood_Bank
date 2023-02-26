import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cataloge/utilits/routes.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool ChangeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(children: [
          Image.asset(
            "assets/images/blood_login_click.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
          ),

          InkWell(
            onTap: () async {
              setState(() {
                ChangeButton = true;
              });
              await Future.delayed(Duration(seconds: 1));
              Navigator.pushNamed(context, MyRoutes.signupRoute);
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: ChangeButton ? 50 : 150,
              height: 40,
              alignment: Alignment.center,
              child: ChangeButton
                  ? Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                  : Text(
                      "USER",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(ChangeButton ? 50 : 8)),
            ),
          ),

          // ElevatedButton(
          //   child: Text("USER",
          //       style: TextStyle(
          //         fontSize: 40,
          //         fontWeight: FontWeight.bold,
          //       )),
          //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
          //   onPressed: () {
          //     Navigator.pushNamed(context, MyRoutes.signupRoute);
          //   },
          // ),

          SizedBox(
            height: 20.0,
          ),

          InkWell(
            onTap: () async {
              setState(() {
                ChangeButton = true;
              });

              Navigator.pushNamed(context, MyRoutes.organizationsignpage); 
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: ChangeButton ? 50 : 200,
              height: 40,
              alignment: Alignment.center,
              child: ChangeButton
                  ? Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                  : Text(
                      "ORGANIZATION",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(ChangeButton ? 50 : 8)),
            ),
          )
        ]),
      ),
    );
  }
}
