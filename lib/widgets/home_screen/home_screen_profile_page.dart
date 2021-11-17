import 'package:flutter/material.dart';

class HomeScreenProfilePage extends StatelessWidget {
  const HomeScreenProfilePage({Key? key}) : super(key: key);

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
