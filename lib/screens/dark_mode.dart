import 'package:dsc_training_project/bloc_cubit/e_commerce_cubit.dart';
import 'package:dsc_training_project/data.dart';
import 'package:flutter/material.dart';

class DarkMode extends StatelessWidget {
  static String id = "Dark Mode";

  const DarkMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          id,
          style: TextStyle(fontSize: 30, color: orangeColor),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: backgroundColor,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Model On",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                Switch(
                  onChanged: (bool value) {
                    ECommerceCubit.get(context).changeThme();
                  },
                  value: ECommerceCubit.get(context).isDark,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
