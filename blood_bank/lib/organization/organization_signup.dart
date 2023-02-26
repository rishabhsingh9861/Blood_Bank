import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_cataloge/login_click.dart';
import 'package:flutter_cataloge/page/home_page.dart';
import 'package:flutter_cataloge/services/usermanagement.dart';
import 'package:flutter_cataloge/utilits/routes.dart';

class organizationSignPage extends StatefulWidget {
  @override
  State<organizationSignPage> createState() => _organizationSignPageState();
}

class _organizationSignPageState extends State<organizationSignPage> {
  final _formKey = GlobalKey<FormState>();
  bool ChangeButton = false;

  final organizationcontroller = TextEditingController();
  final registeredidcontroller = TextEditingController();
  final telephonenumbercontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    organizationcontroller.dispose();
    registeredidcontroller.dispose();
    telephonenumbercontroller.dispose();
    emailcontroller.dispose();
    usernamecontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();

    super.dispose();
  }

  Future addOrganizationUserDetails(
    String organizationname,
    String registeredid,
    String telephone,
    String email,
    String username,
  ) async {
    await FirebaseFirestore.instance
        .collection('organizationusers')
        .doc(organizationname)
        .set({
      'name': organizationname,
      'Registered Id': registeredid,
      'Telephone number': telephone,
      'email': email,
      'User name': username,
    });
  }

  // bool passwordConfirmed() {
  //   if (_passwordcontroller.text.trim() ==
  //       _confirmpasswordcontroller.text.trim()) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(children: [
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: organizationcontroller,
                    decoration: const InputDecoration(
                      hintText: "Enter Organization Name",
                      labelText: "Organization",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: registeredidcontroller,
                    decoration: const InputDecoration(
                      hintText: "Enter Registered Id",
                      labelText: "Registered Id ",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: telephonenumbercontroller,
                    decoration: const InputDecoration(
                      hintText: "101010101010",
                      labelText: "Telephone Number",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      hintText: "abc@gmail.com",
                      labelText: "Email I'd",
                      labelStyle: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: usernamecontroller,
                    decoration: const InputDecoration(
                      hintText: "Yes Or No",
                      labelText: "User Name",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                  TextFormField(
                    controller: _confirmpasswordcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (value.length < 8) {
                        return 'please enter password greater than 8';
                      }
                      if (_passwordcontroller.text.trim() ==
                          _confirmpasswordcontroller.text.trim()) {
                        return 'Please enter the same password as above';
                      } else
                        Null;
                    },
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(ChangeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () {
                        ChangeButton = true;

                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailcontroller.text.trim(),
                          password: _passwordcontroller.text.trim(),
                        );

                        addOrganizationUserDetails(
                          organizationcontroller.text.trim(),
                          registeredidcontroller.text.trim(),
                          telephonenumbercontroller.text.trim(),
                          emailcontroller.text.trim(),
                          usernamecontroller.text.trim(),
                        ).then((value) {
                          Navigator.pushReplacementNamed(
                              context, MyRoutes.organizationapp);
                        }).catchError((e) {
                          print(e);
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: ChangeButton ? 50 : 150,
                        height: 40,
                        alignment: Alignment.center,
                        child: ChangeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
