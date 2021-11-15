import 'package:flutter/material.dart';

class HomePopUpBottomViewItem extends StatelessWidget {
  const HomePopUpBottomViewItem(
      {Key? key,
      required this.index,
      required this.topCategoriesIcons,
      required this.categories})
      : super(key: key);

  final int index;
  final List topCategoriesIcons;
  final List categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(topCategoriesIcons[index]),
                  SizedBox(
                    width: 10,
                  ),
                  Text(categories[index].category)
                ],
              )),
        ),
      ),
    );
  }
}
