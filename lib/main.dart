import 'package:dsc_training_project/screens/home_screen/HomePage.dart';
import 'package:dsc_training_project/screens/Cards.dart';
import 'package:dsc_training_project/screens/Orders.dart';
import 'package:dsc_training_project/screens/settings_screen/Setting.dart';
import 'package:dsc_training_project/screens/SignIn.dart';
import 'package:dsc_training_project/screens/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MaterialApp(
    title: "DSC E-commerce project",
    initialRoute: HomePage.id,
    debugShowCheckedModeBanner: false,
    routes: {
      HomePage.id: (context) => HomePage(),
      Cards.id: (context) => Cards(),
      Orders.id: (context) => Orders(),
      Setting.id: (context) => Setting(),
      SignIn.id: (context) => SignIn(),
      SignUp.id: (context) => SignUp(),
    },
  ));
}
