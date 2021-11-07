import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    );
  }

  Widget getScreenPart1() => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  "assets/bowen_kton.png",
                  fit: BoxFit.cover,
                )),
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
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 8),
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
              return getOfferView(
                  colors[index][0], colors[index][1], Colors.white, index);
            }),
      );

  Widget getScreenPart5() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                                        onTap: () {
                                          // TODO Close this
                                          Navigator.pop(context);
                                        },
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
                              getAllCategoriesItemView(0),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(1),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(2),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(3),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(4),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(5),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(6),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(7),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(8),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(9),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(0),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(1),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(2),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(3),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(4),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(5),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(6),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(7),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(8),
                              SizedBox(
                                width: 15,
                              ),
                              getAllCategoriesItemView(9),
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

  Widget getAllCategoriesItemView(int index) => Padding(
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

  Widget getScreenPart6() => SizedBox(
        height: 70,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topCategoriesCount,
            itemBuilder: (context, index) {
              return getTopCategoriesView(index);
            }),
      );

  Widget getScreenPart7() => Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              children: getCategoryItemCardRowList(
                  MediaQuery.of(context).orientation == Orientation.landscape),
            );
          },
        ),
      );

  // get list of rows of double or triple or single item view
  List<Widget> getCategoryItemCardRowList(bool goTriple) {
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
        result.add(getCategoryItemCardRow(
            model1, model2, model3, index1, index2, index3, 3, i == size - 1));
      } else if (!isOdd ||
          (isOdd && i != size - 1) ||
          (isOdd && goTriple && i == size - 1)) {
        ItemModel model1 = models[currentTopCategoriesIndex][index];
        int index1 = index;
        index++;
        ItemModel model2 = models[currentTopCategoriesIndex][index];
        int index2 = index;
        index++;
        result.add(getCategoryItemCardRow(
            model1, model2, null, index1, index2, null, 2, i == size - 1));
      } else {
        ItemModel model1 = models[currentTopCategoriesIndex][index];
        int index1 = index;
        result.add(getCategoryItemCardRow(
            model1, null, null, index1, null, null, 1, i == size - 1));
      }
    }
    return result;
  }

  // get row of double or triple or single item view
  Widget getCategoryItemCardRow(
      ItemModel model1,
      ItemModel? model2,
      ItemModel? model3,
      int index1,
      int? index2,
      int? index3,
      int num,
      bool isLastItem) {
    if (num == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: getCategoryItemCard(model1, isLastItem)),
          SizedBox(
            width: 15,
          ),
          Expanded(child: getCategoryItemCard(model2!, isLastItem))
        ],
      );
    } else if (num == 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: getCategoryItemCard(model1, isLastItem)),
          SizedBox(
            width: 15,
          ),
          Expanded(child: getCategoryItemCard(model2!, isLastItem)),
          SizedBox(
            width: 15,
          ),
          Expanded(child: getCategoryItemCard(model3!, isLastItem))
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [getCategoryItemCard(model1, isLastItem)],
      ),
    );
  }

  // get item card view
  Widget getCategoryItemCard(ItemModel model, bool isLastItem) => Padding(
        padding: EdgeInsets.only(top: 15, bottom: isLastItem ? 15 : 0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              //TODO got to item screen
            },
            child: Container(
              width: isLastItem ? 220 : 0,
              height: 250,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.isOfferEnabled ? model.offer : "",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      InkWell(
                          onTap: () => setState(() {
                                bool exists = favourites
                                    .any((element) => element.id == model.id);
                                if (exists) {
                                  favourites.removeWhere(
                                      (element) => element.id == model.id);
                                } else {
                                  favourites.add(model);
                                }
                              }),
                          child: Icon(
                            Icons.favorite,
                            color: favourites
                                    .any((element) => element.id == model.id)
                                ? Colors.red
                                : Colors.grey,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: Image.asset(
                    model.imagePath,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    model.itemName,
                    style: TextStyle(fontSize: 20, color: Colors.black38),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      text: model.price,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: ' '),
                        TextSpan(
                            text: model.priceBeforeOffer,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black38,
                                decoration: TextDecoration.lineThrough)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  // get top categories view item
  Widget getTopCategoriesView(int index) => InkWell(
        onTap: () => setState(() {
          currentTopCategoriesIndex = index;
        }),
        child: Container(
          width: 60,
          height: 20,
          margin: EdgeInsets.only(
              left: 15,
              top: 10,
              bottom: 10,
              right: index == (topCategoriesCount - 1) ? 15 : 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentTopCategoriesIndex == index
                  ? Colors.orange
                  : Colors.black12),
          child: Center(
            child: Icon(
              topCategoriesIcons[index],
              color: currentTopCategoriesIndex == index
                  ? Colors.white
                  : Colors.black12,
            ),
          ),
        ),
      );

  // get offer view item
  Widget getOfferView(
          Color backColor1, Color backColor2, Color btnColor, int index) =>
      Container(
        margin: EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 15,
            right: index == (offerCount - 1) ? 15 : 0),
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
                  offerImages[index],
                  width: 90,
                  height: 90,
                ),
              )
            ],
          ),
        ),
      );
}

// items category model class
class Category {
  final int id;
  final String category;

  Category({required this.id, required this.category});
}

// item model class
class ItemModel {
  int id;
  bool isOfferEnabled;
  String offer;
  String priceBeforeOffer;
  String imagePath;
  String itemName;
  String price;
  int categoryId;

  ItemModel(
      {required this.id,
      required this.isOfferEnabled,
      required this.offer,
      required this.priceBeforeOffer,
      required this.imagePath,
      required this.itemName,
      required this.price,
      required this.categoryId});
}
