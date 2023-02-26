import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatelessWidget {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 350),
                child: Container(
                    color: Colors.orange,
                    height: 40,
                    width: 100,
                    child: TextButton(
                        onPressed: signUserOut, child: Text("Signout"))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
