import 'dart:ui';

import 'package:dsc_training_project/screens/home_screen/home_screen_bottom_navigation_view_item.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_favourite_page.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_home_page.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_my_card_page.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_profile_page.dart';
import 'package:dsc_training_project/screens/home_screen/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // number of offers and offer views
  int offerCount = 3;

  // number of top categories and categories views
  int topCategoriesCount = 10;

  // favourites list update by heart click on each card view
  List<ItemModel> favourites = [];

  // index of current selected category
  int currentTopCategoriesIndex = 0;

  // index of selected icon in bottom nav bar
  int currentSelectedScreenView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentSelectedScreenView == 0
          ? HomeScreenPage(
              topCategoryOnClick: topCategoryOnClick,
              topCategoriesCount: topCategoriesCount,
              currentTopCategoriesIndex: currentTopCategoriesIndex,
              favourites: favourites,
              offersNumber: offerCount,
              itemCardViewUpdateFavourites: itemCardViewUpdateFavourites,
            )
          : currentSelectedScreenView == 1
              ? HomeScreenFavouritePage(
                  itemCardViewUpdateFavourites: itemCardViewUpdateFavourites,
                  favourites: favourites,
                )
              : currentSelectedScreenView == 2
                  ? HomeScreenMyCardPage()
                  : HomeScreenProfilePage(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBottomNavigationBar() => Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeBottomNavigationViewItem(
                index: 0,
                text: "Home",
                iconData: Icons.home,
                updateCurrentSelectedHomeScreenPage:
                    updateCurrentSelectedHomeScreenPage,
                currentSelectedScreenView: currentSelectedScreenView),
            HomeBottomNavigationViewItem(
                index: 1,
                text: "Favourites",
                iconData: Icons.favorite,
                updateCurrentSelectedHomeScreenPage:
                    updateCurrentSelectedHomeScreenPage,
                currentSelectedScreenView: currentSelectedScreenView),
            HomeBottomNavigationViewItem(
                index: 2,
                text: "My Cart",
                iconData: Icons.shopping_cart,
                updateCurrentSelectedHomeScreenPage:
                    updateCurrentSelectedHomeScreenPage,
                currentSelectedScreenView: currentSelectedScreenView),
            HomeBottomNavigationViewItem(
                index: 3,
                text: "Profile",
                iconData: Icons.person,
                updateCurrentSelectedHomeScreenPage:
                    updateCurrentSelectedHomeScreenPage,
                currentSelectedScreenView: currentSelectedScreenView),
          ],
        ),
      );

  // update current selected page in home screen from bottom nav bar
  updateCurrentSelectedHomeScreenPage(int index) => setState(() {
        currentSelectedScreenView = index;
      });

  // change viewed items  by change selected category
  topCategoryOnClick(int index) => setState(() {
        currentTopCategoriesIndex = index;
      });

  // add or remove item card view from favourites
  itemCardViewUpdateFavourites(ItemModel model) => setState(() {
        bool exists = favourites.any((element) => element.id == model.id);
        if (exists) {
          favourites.removeWhere((element) => element.id == model.id);
        } else {
          favourites.add(model);
        }
      });
}
