import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class patientRequest extends StatefulWidget {
  const patientRequest({super.key});

  @override
  State<patientRequest> createState() => _patientRequestState();
}

class _patientRequestState extends State<patientRequest> {
  @override

  // document ids

  List<String> docIds = [];

  // get docIds

  Future getDocsId() async {
    await FirebaseFirestore.instance
        .collection('requestusers')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
            }));
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
