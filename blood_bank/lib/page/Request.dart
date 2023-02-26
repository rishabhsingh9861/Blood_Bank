import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/page/app.dart';
import 'package:flutter_cataloge/page/dropDownButton.dart';
import 'package:flutter_cataloge/page/home_page.dart';
import 'package:flutter_cataloge/page/locationForEvery.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cataloge/utilits/routes.dart';

class Request extends StatefulWidget {
  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final _formKey = GlobalKey<FormState>();

  bool ChangeButton = false;

  final BloodPlatelets = [
    "Blood",
    "Platelets",
  ];
  String? selectedBloodPlatelets = "Blood";

  final BloodGroup = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
    "A1+",
    "A1-",
    "A2+",
    "A2-",
    "A1B+",
    "A1B-",
    "A2B+",
    "A2B-"
  ];
  String? selectedBloodgroup = "AB+";

  loadData() async {}

  final patientNamecontroller = TextEditingController();
  final contactpersoncontroller = TextEditingController();
  final unitscontroller = TextEditingController();
  final patientconditioncontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final patientdobcontroller = TextEditingController();
  final requireddatecontroller = TextEditingController();
  final contactnumbercontroller = TextEditingController();
  final additionalnotecontroller = TextEditingController();

  @override
  void dispose() {
    patientNamecontroller.dispose();
    contactpersoncontroller.dispose();
    unitscontroller.dispose();
    patientconditioncontroller.dispose();
    agecontroller.dispose();
    patientdobcontroller.dispose();
    requireddatecontroller.dispose();
    contactnumbercontroller.dispose();
    additionalnotecontroller.dispose();
    super.dispose();
  }

  Future addRequestusers(
    String selectedBloodPlatelets,
    String patientname,
    String contactperson,
    String contactnumber,
    String selectedBloodgroup,
    String age,
    String patientdob,
    String units,
    String patientcondition,
    String additionalnote,
    String requireddate,
  ) async {
    await FirebaseFirestore.instance
        .collection('requestusers')
        .doc(patientname)
        .set({
      'blood/Platelets': selectedBloodPlatelets,
      'patientName': patientname,
      'contact Person': contactperson,
      'contact Number': contactnumber,
      'bloodgroup': selectedBloodgroup,
      'age': age,
      'dob': patientdob,
      'units': units,
      'patient condition': patientcondition,
      'additional note': additionalnote,
      'Requied date': requireddate,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: Scaffold(
                  appBar: AppBar(
                    title: Center(
                      child: Text(
                        "Patient Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.orangeAccent),
                      ),
                    ),
                  ),
                  body: Material(
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          DropdownButtonFormField(
                              dropdownColor: Color.fromARGB(255, 239, 201, 198),
                              value: selectedBloodPlatelets,
                              items: BloodPlatelets.map((e) => DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepPurpleAccent,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                    value: e,
                                  )).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedBloodPlatelets = value as String;
                                });
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          DropdownButtonFormField(
                              dropdownColor: Color.fromARGB(255, 239, 201, 198),
                              value: selectedBloodgroup,
                              items: BloodGroup.map((e) => DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepPurpleAccent,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                    value: e,
                                  )).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedBloodgroup = value as String;
                                });
                              }),
                          SizedBox(
                            height: 10,
                          ),
    
                          Container(height: 60, child: Location()),
    
                          SizedBox(
                            height: 10,
                          ),
    
                          TextFormField(
                            controller: patientNamecontroller,
                            decoration: InputDecoration(
                                labelText: "Patient Name",
                                labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurpleAccent,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
    
                          // TextFormField(
                          //   controller: contactpersoncontroller,
                          //   decoration: InputDecoration(
                          //       labelText: "contact Person",
                          //       labelStyle: TextStyle(
                          //           fontSize: 20.0, fontWeight: FontWeight.bold,
                          //            color: Colors.deepPurpleAccent,),
                          //       enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(12),
                          //           borderSide: BorderSide(color: Colors.white)),
                          //       focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.deepPurple),
                          //           borderRadius: BorderRadius.circular(12))),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter some text';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // TextFormField(
                          //   controller: contactnumbercontroller,
                          //   decoration: InputDecoration(
                          //       labelText: "Contact Number",
                          //       labelStyle: TextStyle(
                          //           fontSize: 20.0, fontWeight: FontWeight.bold,
                          //            color: Colors.deepPurpleAccent,),
                          //       enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(12),
                          //           borderSide: BorderSide(color: Colors.white)),
                          //       focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.deepPurple),
                          //           borderRadius: BorderRadius.circular(12))),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter some text';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // // SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   height: 50,
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.rectangle,
                          //   ),
                          //   child: DropDownButton(),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: agecontroller,
                            decoration: InputDecoration(
                                labelText: "Patient Age",
                                labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurpleAccent,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: patientdobcontroller,
                            decoration: InputDecoration(
                                labelText: "patient Dob",
                                labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurpleAccent,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: unitscontroller,
                            decoration: InputDecoration(
                                labelText: "How Much units of blood need",
                                labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurpleAccent,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: patientconditioncontroller,
                            decoration: InputDecoration(
                                labelText: "patient Condition",
                                labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurpleAccent,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: additionalnotecontroller,
                            decoration: InputDecoration(
                                labelText: "Additional Note",
                                labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurpleAccent,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: requireddatecontroller,
                            decoration: InputDecoration(
                                labelText: "Required date",
                                labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurpleAccent,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
    
                          // ElevatedButton(
                          //     onPressed: () async {
                          //       ChangeButton = true;
                          //       try {
                          //         addRequestusers(
                          //           selectedBloodPlatelets.toString(),
                          //           patientNamecontroller.text.trim(),
                          //           contactpersoncontroller.text.toString(),
                          //           contactnumbercontroller.text.toString(),
                          //           selectedBloodgroup.toString(),
                          //           agecontroller.text.toString(),
                          //           patientdobcontroller.text.toString(),
                          //           unitscontroller.text.toString(),
                          //           patientconditioncontroller.text.trim(),
                          //           additionalnotecontroller.text.toString(),
                          //           requireddatecontroller.text.toString(),
                          //         );
                          //         await showDialog(
                          //             context: context,
                          //             builder: (context) {
                          //               return AlertDialog(
                          //                 content: Text('Request Sent Sucessfully'),
                          //               );
                          //             }).then((value) {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) => App()),
                          //           );
                          //         });
                          //       } catch (e) {
                          //         print(e);
                          //         showDialog(
                          //             context: context,
                          //             builder: (context) {
                          //               return AlertDialog(
                          //                 content: Text(e.toString()),
                          //               );
                          //             });
                          //       }
                          //     },
                          //     child: Text(
                          //       "Send Request",
                          //       style: TextStyle(
                          //           fontSize: 20.0, fontWeight: FontWeight.bold),
                          //     ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Contact Person Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.orangeAccent)),
                  ),
                  body: ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: contactpersoncontroller,
                        decoration: InputDecoration(
                            labelText: "contact Person",
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent,
                            ),
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: contactnumbercontroller,
                        decoration: InputDecoration(
                            labelText: "Contact Number",
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent,
                            ),
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            ChangeButton = true;
                            try {
                              addRequestusers(
                                selectedBloodPlatelets.toString(),
                                patientNamecontroller.text.trim(),
                                contactpersoncontroller.text.toString(),
                                contactnumbercontroller.text.toString(),
                                selectedBloodgroup.toString(),
                                agecontroller.text.toString(),
                                patientdobcontroller.text.toString(),
                                unitscontroller.text.toString(),
                                patientconditioncontroller.text.trim(),
                                additionalnotecontroller.text.toString(),
                                requireddatecontroller.text.toString(),
                              );
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text('Request Sent Sucessfully'),
                                    );
                                  });
                              //.then((value) {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePage()),
                              //   );
                              // });
                            } catch (e) {
                              print(e);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(e.toString()),
                                    );
                                  });
                            }
                          },
                          child: Text(
                            "Send Request",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
