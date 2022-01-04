import 'dart:ui';

import 'package:dsc_training_project/models/item_model.dart';
import 'package:dsc_training_project/widgets/home_screen/home_screen_favourite_page.dart';
import 'package:dsc_training_project/widgets/home_screen/home_screen_home_page.dart';
import 'package:dsc_training_project/widgets/home_screen/home_screen_my_card_page.dart';
import 'package:dsc_training_project/widgets/home_screen/home_screen_profile_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:dsc_training_project/widgets/drawer.dart';

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

  // key for home page scaffold to open drawer through
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: currentSelectedScreenView == 0
          ? HomeScreenPage(
              topCategoryOnClick: topCategoryOnClick,
              topCategoriesCount: topCategoriesCount,
              currentTopCategoriesIndex: currentTopCategoriesIndex,
              favourites: favourites,
              offersNumber: offerCount,
              itemCardViewUpdateFavourites: itemCardViewUpdateFavourites,
              scaffoldKey: _scaffoldKey,
            )
          : currentSelectedScreenView == 1
              ? HomeScreenFavouritePage(
                  itemCardViewUpdateFavourites: itemCardViewUpdateFavourites,
                  favourites: favourites,
                  scaffoldKey: _scaffoldKey,
                )
              : currentSelectedScreenView == 2
                  ? HomeScreenMyCardPage(
                      scaffoldKey: _scaffoldKey,
                    )
                  : HomeScreenProfilePage(
                      scaffoldKey: _scaffoldKey,
                    ),
      bottomNavigationBar: getBottomNavigationBar1(),
      drawer: MyDrawer(
        currentPage: HomePage.id,
      ),
    );
  }

  BottomNavigationBar getBottomNavigationBar1() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentSelectedScreenView,
        selectedItemColor: Colors.orange,
        onTap: (index) => updateCurrentSelectedHomeScreenPage(index),
        selectedFontSize: 15,
        selectedLabelStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.orange.shade50,
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'My Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
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
