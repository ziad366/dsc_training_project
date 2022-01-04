import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

// colors used in application
const defaultOrangeColor = Color.fromRGBO(241, 107, 39, 1);
const blackColor = Colors.black;
const whiteColor = Color.fromRGBO(245, 248, 253,1);
const cartWhite70ColorLight = Colors.white70;
const cartWhite70ColorDark = Colors.white24;
const greyColor = Colors.grey;
const StarAmberColor= Colors.amber;


 dialog(context){
  return  CoolAlert.show(
    context: context,
    type: CoolAlertType.success,
    text: 'product added successfully!',
    autoCloseDuration: Duration(seconds: 2),
    backgroundColor: defaultOrangeColor,
    confirmBtnColor: defaultOrangeColor,
    loopAnimation: true,
  );
}