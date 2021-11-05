import 'package:dsc_training_project/screens/HomePage.dart';
import 'package:dsc_training_project/screens/Cards.dart';
import 'package:dsc_training_project/screens/Orders.dart';
import 'package:dsc_training_project/screens/Setting.dart';
import 'package:dsc_training_project/screens/SignIn.dart';
import 'package:dsc_training_project/screens/SignUp.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: "DSC E-commerce project",
  initialRoute:  HomePage.id  ,
  routes: {
    Cards.id : (context) => Cards(),
    Orders.id : (context) => Orders(),
    Setting.id : (context) => Setting(),
    SignIn.id : (context) => SignIn(),
    SignUp.id : (context) => SignUp(),


  },

));
