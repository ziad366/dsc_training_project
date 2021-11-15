import 'package:flutter/material.dart';

class HomeTopCategoriesViewItem extends StatelessWidget {
  const HomeTopCategoriesViewItem(
      {Key? key,
      required this.currentIndex,
      required this.updateSelectedTopCategoryViewItem,
      required this.topCategoriesCount,
      required this.currentTopCategoriesIndex,
      required this.topCategoriesIcons})
      : super(key: key);

  final int currentIndex;
  final Function(int index) updateSelectedTopCategoryViewItem;
  final int topCategoriesCount;
  final int currentTopCategoriesIndex;
  final List topCategoriesIcons;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => updateSelectedTopCategoryViewItem(currentIndex),
      child: Container(
        width: 60,
        height: 20,
        margin: EdgeInsets.only(
            left: 15,
            top: 10,
            bottom: 10,
            right: currentIndex == (topCategoriesCount - 1) ? 15 : 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentTopCategoriesIndex == currentIndex
                ? Colors.orange
                : Colors.black12),
        child: Center(
          child: Icon(
            topCategoriesIcons[currentIndex],
            color: currentTopCategoriesIndex == currentIndex
                ? Colors.white
                : Colors.black12,
          ),
        ),
      ),
    );
  }
}
