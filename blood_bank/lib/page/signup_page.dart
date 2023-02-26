import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_cataloge/login_click.dart';
import 'package:flutter_cataloge/page/home_page.dart';
import 'package:flutter_cataloge/services/usermanagement.dart';
import 'package:flutter_cataloge/utilits/routes.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class SignPage extends StatefulWidget {
  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final _formKey = GlobalKey<FormState>();

  bool ChangeButton = false;

  final _passwordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final dobcontroller = TextEditingController();
  final bloodgroupcontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  final contactnumbercontroller = TextEditingController();
  final hivcontroller = TextEditingController();
  final diabetescontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    namecontroller.dispose();
    agecontroller.dispose();
    dobcontroller.dispose();
    bloodgroupcontroller.dispose();
    statecontroller.dispose();
    citycontroller.dispose();
    pincodecontroller.dispose();
    contactnumbercontroller.dispose();
    hivcontroller.dispose();
    diabetescontroller.dispose();
    super.dispose();
  }

  Future addUserDetails(
      String name,
      String dob,
      String bloodgroup,
      String state,
      String city,
      String email,
      String hiv,
      String diabetes,
      int age,
      int pincode,
      int contactnumber) async {
    await FirebaseFirestore.instance.collection('users').doc(name).set({
      'name': name,
      'dob': dob,
      'bloodgroup': bloodgroup,
      'state': state,
      'city': city,
      'email': email,
      'hiv': hiv,
      'diabetes': diabetes,
      'age': age,
      'pincode ': pincode,
      'contactnumber': contactnumber,
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Material(
          child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  hintText: "Enter Name",
                  labelText: "USERNAME",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: agecontroller,
                decoration: const InputDecoration(
                  hintText: "Enter Age",
                  labelText: "Age",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: dobcontroller,
                decoration: const InputDecoration(
                  hintText: "date/month/year",
                  hintStyle: TextStyle(color: Colors.orange),
                  labelText: "Date Of Birth",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: bloodgroupcontroller,
                decoration: const InputDecoration(
                  hintText: "AB+ , B+ , A+ , O+ , O- ",
                  labelText: "Blood Group",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: statecontroller,
                decoration: const InputDecoration(
                  hintText: "Maharastra",
                  labelText: "State",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: citycontroller,
                decoration: const InputDecoration(
                  hintText: "Mumbai",
                  labelText: "City",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: pincodecontroller,
                decoration: const InputDecoration(
                  hintText: "000000",
                  labelText: "pincode",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: contactnumbercontroller,
                decoration: const InputDecoration(
                  hintText: "101010101010",
                  labelText: "Contact Number",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  hintText: "abc@gmail.com",
                  labelText: "Email I'd",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: hivcontroller,
                decoration: const InputDecoration(
                  hintText: "Yes Or No",
                  labelText: "HIV+",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: diabetescontroller,
                decoration: const InputDecoration(
                  hintText: "Yes Or No",
                  labelText: "Diabetes",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "At least 8 characters",
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
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
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "At least 8 characters ",
                  labelText: "Confirm Password",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orangeAccent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.purple)),
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                  hintStyle: TextStyle(color: Colors.orange),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value.length < 8) {
                    return 'please enter password greater than 8';
                  }
                  if (value != _passwordcontroller.text.trim()) {
                    return 'Please enter the same password as above';
                  } else
                    Null;
                },
              ),
              const SizedBox(
                height: 50.0,
              ),
              Material(
                color: Color.fromARGB(255, 249, 179, 89),
                borderRadius: BorderRadius.circular(ChangeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    ChangeButton = true;
                
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailcontroller.text.trim(),
                      password: _passwordcontroller.text.trim(),
                    );
                
                    addUserDetails(
                            namecontroller.text.trim(),
                            dobcontroller.text.trim(),
                            bloodgroupcontroller.text.trim(),
                            statecontroller.text.trim(),
                            citycontroller.text.trim(),
                            emailcontroller.text.trim(),
                            hivcontroller.text.trim(),
                            diabetescontroller.text.trim(),
                            int.parse(agecontroller.text.trim()),
                            int.parse(pincodecontroller.text.trim()),
                            int.parse(contactnumbercontroller.text.trim()))
                        .then((value) {
                      Navigator.pushReplacementNamed(context, MyRoutes.App);
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
              ),
              SizedBox(
                height: 12,
              )
            ]),
                ),
              ),
          )),
    );
  }
}
