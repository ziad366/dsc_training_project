import 'package:flutter/material.dart';

class HomeOfferViewItem extends StatelessWidget {
  const HomeOfferViewItem(
      {Key? key,
      required this.backColor1,
      required this.backColor2,
      required this.btnColor,
      required this.currentIndex,
      required this.offersNumber,
      required this.offerImages})
      : super(key: key);

  final Color backColor1;
  final Color backColor2;
  final Color btnColor;
  final int currentIndex;
  final int offersNumber;
  final List offerImages;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 15,
          right: currentIndex == (offersNumber - 1) ? 15 : 0),
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [backColor1, backColor2]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "30% OFF DURING COVID 19",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        // TODO get the offer
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          "Get Now",
                          style: TextStyle(color: backColor1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset(
                offerImages[currentIndex],
                width: 90,
                height: 90,
              ),
            )
          ],
        ),
      ),
    );
  }
}
