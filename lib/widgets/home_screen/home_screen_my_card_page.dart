import 'package:flutter/material.dart';

class HomeScreenMyCardPage extends StatelessWidget {
  const HomeScreenMyCardPage({Key? key, required this.scaffoldKey})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            getScreenPart1(context)
          ],
        ),
      ),
    ));
  }

  Widget getScreenPart1(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              color: Colors.black12,
              child: InkWell(
                onTap: () {
                  if (scaffoldKey.currentState != null) {
                    scaffoldKey.currentState!.openDrawer();
                  }
                },
                child: Container(
                    width: 50,
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/bowen_kton.png",
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ],
        ),
      );
}
