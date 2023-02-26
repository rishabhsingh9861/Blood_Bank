import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Image.asset(
                  "assets/images/blood_login_click.png",
                  fit: BoxFit.cover,
                ).safeArea(),
         Container(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    CupertinoIcons.circle_filled,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Nearby Camps",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.circle_filled,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Nearby Blood Banks",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.circle_filled,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Nearby Need",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.circle_filled,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Nearby SameBlood Group Need",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            ),
          ).expand(),
        ],
      ),
    );
  }
}
