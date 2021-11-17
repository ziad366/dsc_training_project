import 'package:flutter/material.dart';

class HomeBottomNavigationViewItem extends StatelessWidget {
  const HomeBottomNavigationViewItem(
      {Key? key,
      required this.index,
      required this.text,
      required this.iconData,
      required this.updateCurrentSelectedHomeScreenPage,
      required this.currentSelectedScreenView})
      : super(key: key);

  final int index;
  final String text;
  final IconData iconData;
  final Function(int index) updateCurrentSelectedHomeScreenPage;
  final int currentSelectedScreenView;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => updateCurrentSelectedHomeScreenPage(index),
      child: currentSelectedScreenView == index
          ? Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Icon(
                    iconData,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  )
                ],
              ),
            )
          : Icon(
              iconData,
              color: Colors.grey,
            ),
    );
  }
}
