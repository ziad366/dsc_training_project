import 'dart:ui';

import 'package:dsc_training_project/screens/home_screen/category_model.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_card_view_item_row.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_offer_view_item.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_top_categories_view_item.dart';
import 'package:dsc_training_project/screens/home_screen/item_model.dart';
import 'package:dsc_training_project/screens/settings_screen/Setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen_bottom_navigation_view_item.dart';
import 'home_screen_popup_bottom_view_item.dart';

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

  // images of different offers views
  List<String> offerImages = [
    "assets/offer1.jpg",
    "assets/offer2.jpg",
    "assets/offer3.jpg"
  ];

  // icons of different categories
  List<IconData> topCategoriesIcons = [
    Icons.watch,
    FontAwesomeIcons.tshirt,
    FontAwesomeIcons.shoePrints,
    FontAwesomeIcons.shoppingBag,
    Icons.watch,
    FontAwesomeIcons.tshirt,
    FontAwesomeIcons.shoePrints,
    FontAwesomeIcons.shoppingBag,
    Icons.watch,
    FontAwesomeIcons.tshirt,
  ];

  // index of current selected category
  int currentTopCategoriesIndex = 0;

  // index of selected icon in bottom nav bar
  int currentSelectedScreenView = 0;

  // colors of different offers views
  List<List<Color>> colors = [
    [
      Colors.deepOrange,
      Colors.orange,
    ],
    [
      Colors.blue,
      Colors.lightBlueAccent,
    ],
    [
      Colors.red,
      Colors.redAccent,
    ]
  ];

  // list of top categories
  List<Category> categories = [
    Category(id: 1, category: "Watches"),
    Category(id: 2, category: "T_Shirts"),
    Category(id: 3, category: "Shoes"),
    Category(id: 4, category: "Bags"),
    Category(id: 5, category: "Watches"),
    Category(id: 6, category: "T_Shirts"),
    Category(id: 7, category: "Shoes"),
    Category(id: 8, category: "Bags"),
    Category(id: 9, category: "Watches"),
    Category(id: 10, category: "T_Shirts"),
  ];

  // list of items
  List<List<ItemModel>> models = [
    [
      ItemModel(
          imagePath: 'assets/1.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 1),
      ItemModel(
          imagePath: 'assets/2.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 2),
      ItemModel(
          imagePath: 'assets/3.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 3),
      ItemModel(
          imagePath: 'assets/4.png',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 4),
      ItemModel(
          imagePath: 'assets/5.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 5),
    ],
    [
      ItemModel(
          imagePath: 'assets/6.png',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 6),
      ItemModel(
          imagePath: 'assets/7.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 7),
      ItemModel(
          imagePath: 'assets/8.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 8),
      ItemModel(
          imagePath: 'assets/9.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 9),
      ItemModel(
          imagePath: 'assets/10.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 10),
    ],
    [
      ItemModel(
          imagePath: 'assets/11.jpeg',
          categoryId: 3,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 11),
      ItemModel(
          imagePath: 'assets/12.jpg',
          categoryId: 3,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 12),
      ItemModel(
          imagePath: 'assets/13.jpg',
          categoryId: 3,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 13),
      ItemModel(
          imagePath: 'assets/14.jpeg',
          categoryId: 3,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 14),
      ItemModel(
          imagePath: 'assets/15.jpg',
          categoryId: 3,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 15),
    ],
    [
      ItemModel(
          imagePath: 'assets/16.jpg',
          categoryId: 4,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 16),
      ItemModel(
          imagePath: 'assets/17.jpg',
          categoryId: 4,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 17),
      ItemModel(
          imagePath: 'assets/18.png',
          categoryId: 4,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 18),
      ItemModel(
          imagePath: 'assets/19.jpg',
          categoryId: 4,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 19),
      ItemModel(
          imagePath: 'assets/20.jpg',
          categoryId: 4,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 29),
    ],
    [
      ItemModel(
          imagePath: 'assets/1.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 21),
      ItemModel(
          imagePath: 'assets/2.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 22),
      ItemModel(
          imagePath: 'assets/3.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 23),
      ItemModel(
          imagePath: 'assets/4.png',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 24),
      ItemModel(
          imagePath: 'assets/5.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 25),
    ],
    [
      ItemModel(
          imagePath: 'assets/6.png',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 26),
      ItemModel(
          imagePath: 'assets/7.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 27),
      ItemModel(
          imagePath: 'assets/8.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 28),
      ItemModel(
          imagePath: 'assets/9.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 29),
      ItemModel(
          imagePath: 'assets/10.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 30),
    ],
    [
      ItemModel(
          imagePath: 'assets/11.jpeg',
          categoryId: 3,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 31),
      ItemModel(
          imagePath: 'assets/12.jpg',
          categoryId: 3,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 32),
      ItemModel(
          imagePath: 'assets/13.jpg',
          categoryId: 3,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 33),
      ItemModel(
          imagePath: 'assets/14.jpeg',
          categoryId: 3,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 34),
      ItemModel(
          imagePath: 'assets/15.jpg',
          categoryId: 3,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 35),
    ],
    [
      ItemModel(
          imagePath: 'assets/16.jpg',
          categoryId: 4,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 36),
      ItemModel(
          imagePath: 'assets/17.jpg',
          categoryId: 4,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 37),
      ItemModel(
          imagePath: 'assets/18.png',
          categoryId: 4,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 38),
      ItemModel(
          imagePath: 'assets/19.jpg',
          categoryId: 4,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 39),
      ItemModel(
          imagePath: 'assets/20.jpg',
          categoryId: 4,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 40),
    ],
    [
      ItemModel(
          imagePath: 'assets/1.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 41),
      ItemModel(
          imagePath: 'assets/2.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 42),
      ItemModel(
          imagePath: 'assets/3.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 43),
      ItemModel(
          imagePath: 'assets/4.png',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 44),
      ItemModel(
          imagePath: 'assets/5.jpg',
          categoryId: 1,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 45),
    ],
    [
      ItemModel(
          imagePath: 'assets/6.png',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 46),
      ItemModel(
          imagePath: 'assets/7.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 47),
      ItemModel(
          imagePath: 'assets/8.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 48),
      ItemModel(
          imagePath: 'assets/9.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '100\$',
          isOfferEnabled: true,
          priceBeforeOffer: '130\$',
          id: 49),
      ItemModel(
          imagePath: 'assets/10.jpg',
          categoryId: 2,
          itemName: 'Apple Watch - M2',
          offer: '30% OFF',
          price: '140\$',
          isOfferEnabled: true,
          priceBeforeOffer: '200\$',
          id: 50),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              getScreenPart1(),
              getScreenPart2(),
              getScreenPart3(),
              getScreenPart4(),
              getScreenPart5(),
              getScreenPart6(),
              getScreenPart7(),
            ],
          ),
        ),
      )),
      bottomNavigationBar: getScreenPart8(),
    );
  }

  Widget getScreenPart1() => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              color: Colors.black12,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Setting.id);
                  // TODO open Drawer
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
            Material(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              color: Colors.black12,
              child: InkWell(
                onTap: () {
                  // TODO search for specific item
                },
                child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ),
            ),
          ],
        ),
      );

  Widget getScreenPart2() => Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 8),
        child: Row(
          children: [
            Text(
              "Hello Rocky",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
                width: 35,
                height: 35,
                child: Image.asset(
                  "assets/care_emoje.png",
                  fit: BoxFit.cover,
                )),
          ],
        ),
      );

  Padding getScreenPart3() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              "Lets gets somethings?",
              style: TextStyle(fontSize: 20, color: Colors.black38),
            ),
          ],
        ),
      );

  Widget getScreenPart4() => SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offerCount,
        itemBuilder: (context, index) {
          return HomeOfferViewItem(
            backColor1: colors[index][0],
            backColor2: colors[index][1],
            btnColor: Colors.white,
            currentIndex: index,
            offersNumber: offerCount,
            offerImages: offerImages,
          );
        },
      ));

  Widget getScreenPart5() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Top Categories",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    clipBehavior: Clip.hardEdge,
                    builder: (BuildContext context) {
                      return Container(
                        height: 300,
                        color: Colors.black12,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "All Categories",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Material(
                                      clipBehavior: Clip.hardEdge,
                                      borderRadius: BorderRadius.circular(20),
                                      child: InkWell(
                                        onTap: () => Navigator.pop(context),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "CLOSE",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              HomePopUpBottomViewItem(
                                index: 0,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 1,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 2,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 3,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 4,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 5,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 6,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 7,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 8,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 9,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 0,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 1,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 2,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 3,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 4,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 5,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 6,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 7,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 8,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              HomePopUpBottomViewItem(
                                index: 9,
                                topCategoriesIcons: topCategoriesIcons,
                                categories: categories,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "SEE ALL",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget getScreenPart6() => SizedBox(
        height: 70,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topCategoriesCount,
            itemBuilder: (context, index) {
              return HomeTopCategoriesViewItem(
                  currentIndex: index,
                  topCategoriesCount: topCategoriesCount,
                  currentTopCategoriesIndex: currentTopCategoriesIndex,
                  updateSelectedTopCategoryViewItem: topCategoryOnClick,
                  topCategoriesIcons: topCategoriesIcons);
            }),
      );

  Widget getScreenPart7() => Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: OrientationBuilder(
          builder: (context, orientation) {
            bool goTriple =
                MediaQuery.of(context).orientation == Orientation.landscape;
            List<Widget> result = [];
            bool isOdd = models[currentTopCategoriesIndex].length % 2 != 0;
            bool isTriple = models[currentTopCategoriesIndex].length % 3 != 0;
            int size;
            if (!goTriple)
              size = (!isOdd
                      ? models[currentTopCategoriesIndex].length / 2
                      : models[currentTopCategoriesIndex].length / 2 + 1)
                  .toInt();
            else
              size = (!isTriple
                      ? models[currentTopCategoriesIndex].length / 3
                      : models[currentTopCategoriesIndex].length / 3 + 1)
                  .toInt();
            int index = 0;
            for (int i = 0; i < size; i++) {
              if (isTriple && goTriple && i != size - 1) {
                ItemModel model1 = models[currentTopCategoriesIndex][index];
                int index1 = index;
                index++;
                ItemModel model2 = models[currentTopCategoriesIndex][index];
                int index2 = index;
                index++;
                ItemModel model3 = models[currentTopCategoriesIndex][index];
                int index3 = index;
                index++;
                result.add(HomeCardViewItemRow(
                  model1: model1,
                  model2: model2,
                  model3: model3,
                  index1: index1,
                  index2: index2,
                  index3: index3,
                  num: 3,
                  isLastItem: i == size - 1,
                  itemCardViewUpdateFavourites: itemCardViewUpdateFavourites,
                  favourites: favourites,
                  isOriented: goTriple,
                ));
              } else if (!isOdd ||
                  (isOdd && i != size - 1) ||
                  (isOdd && goTriple && i == size - 1)) {
                ItemModel model1 = models[currentTopCategoriesIndex][index];
                int index1 = index;
                index++;
                ItemModel model2 = models[currentTopCategoriesIndex][index];
                int index2 = index;
                index++;
                result.add(HomeCardViewItemRow(
                  model1: model1,
                  model2: model2,
                  model3: null,
                  index1: index1,
                  index2: index2,
                  index3: null,
                  num: 2,
                  isLastItem: i == size - 1,
                  itemCardViewUpdateFavourites: itemCardViewUpdateFavourites,
                  favourites: favourites,
                  isOriented: goTriple,
                  isLastTwoItems: isOdd && goTriple && i == size - 1,
                ));
              } else {
                ItemModel model1 = models[currentTopCategoriesIndex][index];
                int index1 = index;
                result.add(HomeCardViewItemRow(
                  model1: model1,
                  model2: null,
                  model3: null,
                  index1: index1,
                  index2: null,
                  index3: null,
                  num: 1,
                  isLastItem: i == size - 1,
                  itemCardViewUpdateFavourites: itemCardViewUpdateFavourites,
                  favourites: favourites,
                  isOriented: goTriple,
                ));
              }
            }
            return Column(
              children: result,
            );
          },
        ),
      );

  Widget getScreenPart8() => Container(
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
