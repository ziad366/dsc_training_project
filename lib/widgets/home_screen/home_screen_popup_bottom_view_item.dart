import 'package:flutter/material.dart';

class HomePopUpBottomViewItem extends StatelessWidget {
  const HomePopUpBottomViewItem(
      {Key? key,
      required this.index,
      required this.topCategoriesIcons,
      required this.categories,
      required this.currentTopCategoriesIndex,
      required this.updateSelectedTopCategoryViewItem})
      : super(key: key);

  final int index;
  final List topCategoriesIcons;
  final List categories;
  final int currentTopCategoriesIndex;
  final Function(int index) updateSelectedTopCategoryViewItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        color: currentTopCategoriesIndex == index ? Colors.grey : Colors.white,
        child: InkWell(
          onTap: () {
            updateSelectedTopCategoryViewItem(index);
            Navigator.pop(context);
          },
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    topCategoriesIcons[index],
                    color: currentTopCategoriesIndex == index
                        ? Colors.white
                        : Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    categories[index].category,
                    style: TextStyle(
                        color: currentTopCategoriesIndex == index
                            ? Colors.white
                            : Colors.black),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
