import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/organization/organization_app.dart';
import 'package:flutter_cataloge/organization/patientrequest.dart';
import 'package:flutter_cataloge/page/AboutUs.dart';
import 'package:flutter_cataloge/page/Donate.dart';
import 'package:flutter_cataloge/page/GetLocation.dart';
import 'package:flutter_cataloge/page/History.dart';
import 'package:flutter_cataloge/page/Neaby_hospital.dart';
import 'package:flutter_cataloge/page/Notification.dart';
import 'package:flutter_cataloge/page/Privacy.dart';
import 'package:flutter_cataloge/page/Profile.dart';
import 'package:flutter_cataloge/page/Request.dart';
import 'package:flutter_cataloge/page/Review.dart';
import 'package:flutter_cataloge/page/app.dart';
import 'package:flutter_cataloge/page/find_blood.dart';
import 'package:flutter_cataloge/login_click.dart';
import 'package:flutter_cataloge/page/forgot_passoword.dart';
import 'package:flutter_cataloge/page/home_page.dart';
import 'package:flutter_cataloge/page/login_page_user.dart';
import 'package:flutter_cataloge/organization/organization_signup.dart';
import 'package:flutter_cataloge/page/rate.dart';
import 'package:flutter_cataloge/register.dart';
import 'package:flutter_cataloge/page/signup_page.dart';
import 'package:flutter_cataloge/services/main_page.dart';
import 'package:flutter_cataloge/utilits/routes.dart';
import 'package:flutter_cataloge/widgets/theme.dart';

Future main() async {
  runApp(life());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class life extends StatelessWidget {
  const life({super.key});

  @override
  Widget build(BuildContext context) {
    var initialData2 = null;
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.DarkTheme(context),
      //initialRoute: "/Home",
      routes: {
        "/": (context) => SignPage(),
        MyRoutes.loginRoute: (context) => LoginPage(), // main start page
        MyRoutes.signupRoute: (context) => SignPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.registerRoute: (context) => Register(),
        MyRoutes.loginclickRoute: (context) => LoginClick(),
        MyRoutes.findbloodRoute: (context) => FindBlood(),
        MyRoutes.nearbyhospital: (context) => NearbyHospital(),
        MyRoutes.Request: (context) => Request(),
        MyRoutes.Donate: (context) =>  Donate(),
        MyRoutes.Profile: (context) => Profile(),
        MyRoutes.History: (context) => const History(),
        MyRoutes.Review: (context) => Review(),
        MyRoutes.AboutUs: (context) => AboutUs(),
        MyRoutes.PrivacyPolicy: (context) => PrivacyPolicy(),
        MyRoutes.Rate: (context) => Rate(),
        MyRoutes.App: (context) => App(),
        MyRoutes.Notification: (context) => Notify(), 
        MyRoutes.forgotPassword:(context) => forgotPassword(),
        MyRoutes.organizationsignpage :(context) => organizationSignPage(),
        MyRoutes.organizationapp:(context) => organizationApp(), 
        MyRoutes.patientRequest:(context) => patientRequest(),
      },
    );
  }
}
