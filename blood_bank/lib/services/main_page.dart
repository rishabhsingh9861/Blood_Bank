import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/page/app.dart';
import 'package:flutter_cataloge/page/home_page.dart';
import '../page/login_page_user.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
                                           //   if error comes see video mitch koko  signup user (3.42)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return App();
          } else {
            return   LoginPage() ;
          }
        },
      ),
    );
  }
}
