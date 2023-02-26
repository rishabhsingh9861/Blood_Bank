import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cataloge/page/home_page.dart';
import 'package:flutter_cataloge/page/signup_page.dart';

class UserManagement {
  storeNewuser(UserCredential user, context) {
    FirebaseFirestore.instance.collection('users').add({
      'email': user.user!.email,
      'uid': user.user!.uid,
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed("/App");
    }).catchError((e) {
      print(e);
    });
  }
}
