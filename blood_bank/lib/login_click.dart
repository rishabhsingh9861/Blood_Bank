import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/page/home_page.dart';
import 'package:flutter_cataloge/utilits/routes.dart';

class LoginClick extends StatefulWidget {
  const LoginClick({super.key});

  @override
  State<LoginClick> createState() => _LoginClickState();
}

class _LoginClickState extends State<LoginClick> {
  bool ChangeButton = false;

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


    


  moveToHome(BuildContext context) async {
    setState(() {
      ChangeButton = true;
    });
    
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim()).then((value) {
              Navigator.pushReplacementNamed(context, MyRoutes.App);
            }).catchError((e) {
      print(e);
    });
       
    // await Future.delayed(Duration(seconds: 1));
    // await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      ChangeButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/blood_login_click.png",
                  fit: BoxFit.cover,
                ),
                Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                             enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: _emailController,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                             enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (value.length < 8) {
                        return 'please enter password greater than 8';
                      } else
                        Null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () => moveToHome(context),
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
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(ChangeButton ? 50 : 8)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextButton(
                          child: Text("Forget password",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MyRoutes.forgotPassword);
                          },
                        ),
                      ),
                    ],
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
