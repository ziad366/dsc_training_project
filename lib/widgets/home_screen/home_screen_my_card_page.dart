import 'package:flutter/material.dart';

class HomeScreenMyCardPage extends StatelessWidget {
  const HomeScreenMyCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(),
      ),
    ));
  }
}
