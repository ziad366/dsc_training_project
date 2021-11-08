import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  static String id = "Setting";

  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          id,
          style: TextStyle(fontSize: 30, color: Colors.orange),
        ),
        centerTitle: true,
        backgroundColor: Colors.black12,
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
        color: Colors.black12,
        child: SingleChildScrollView(
          child: Column(
            children: [
              getScreenItemView("Dark Mode", ""),
              getScreenItemView("My Orders", ""),
              getScreenItemView("Account Settings", ""),
              getScreenItemView("About", ""),
            ],
          ),
        ),
      )),
    );
  }

  Widget getScreenItemView(String text, String path) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 25,
                color: Colors.orange,
              ),
            ),
            InkWell(
              onTap: () {
                // TODO go to required path
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.orange,
              ),
            )
          ],
        ),
      );
}
