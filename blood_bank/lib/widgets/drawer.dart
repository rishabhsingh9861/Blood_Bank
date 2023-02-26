import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/page/AboutUs.dart';
import 'package:flutter_cataloge/page/Donate.dart';
import 'package:flutter_cataloge/page/History.dart';
import 'package:flutter_cataloge/page/Privacy.dart';
import 'package:flutter_cataloge/page/Request.dart';
import 'package:flutter_cataloge/page/Review.dart';
import 'package:flutter_cataloge/page/find_blood.dart';
import 'package:flutter_cataloge/page/rate.dart';
import 'package:flutter_cataloge/utilits/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  


VoidCallbackAction(){}

  @override
  Widget build(BuildContext context) {
    // ignore: constant_identifier_names
    // const ImageUrl =
    //     "https://media-exp1.licdn.com/dms/image/D4D03AQFoB4t4XkkYwg/profile-displayphoto-shrink_100_100/0/1665521052467?e=1674691200&v=beta&t=UvoTleEw2uxiox7_T3xkmU3iMz6zqsh5hE29bsycpck";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            const DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Rishabh Singh"),
                  accountEmail: Text("singh@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                  //  backgroundImage: NetworkImage(ImageUrl),
                  ),
                )),
            ListTile(
              onTap: () {
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FindBlood()),
  );
     
              },
              leading: const Icon(
                CupertinoIcons.search,
                color: Colors.red,
              ),
              title: const Text(
                "Find Blood /  Blood Bank",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request()));
              },
              leading: const Icon(
                CupertinoIcons.circle_fill,
                color: Colors.red,
              ),
              title: const Text(
                "Request",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Donate()),
                );
              },
              leading: const Icon(
                CupertinoIcons.rectangle,
                color: Colors.red,
              ),
              title: const Text(
                "Donate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => History()),
  );
     
              },
              leading: const Icon(
                CupertinoIcons.circle_grid_3x3,
                color: Colors.red,
              ),
              title: const Text(
                "History",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Review()),
  );
     
              },
              leading: const Icon(
                CupertinoIcons.circle,
                color: Colors.red,
              ),
              title: const Text(
                "Review",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AboutUs()),
  );
     
              },
              leading: const Icon(
                CupertinoIcons.rectangle,
                color: Colors.red,
              ),
              title: const Text(
                "About Us",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PrivacyPolicy()),
  );
     
              },
              leading: const Icon(
                CupertinoIcons.triangle,
                color: Colors.red,
              ),
              title: const Text(
                "Privacy Policy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Rate()),
  );
     
              },
              leading: const Icon(
                CupertinoIcons.circle,
                color: Colors.red,
              ),
              title: const Text(
                "Rate ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
