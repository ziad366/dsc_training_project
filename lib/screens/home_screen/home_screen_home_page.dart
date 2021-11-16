import 'package:dsc_training_project/screens/home_screen/data.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_card_view_item_row.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_offer_view_item.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_popup_bottom_view_item.dart';
import 'package:dsc_training_project/screens/home_screen/home_screen_top_categories_view_item.dart';
import 'package:dsc_training_project/screens/home_screen/item_model.dart';
import 'package:dsc_training_project/screens/settings_screen/Setting.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage(
      {Key? key,
      required this.offersNumber,
      required this.topCategoriesCount,
      required this.topCategoryOnClick,
      required this.currentTopCategoriesIndex,
      required this.favourites,
      required this.itemCardViewUpdateFavourites})
      : super(key: key);

  final int offersNumber;
  final int topCategoriesCount;
  final Function(int index) topCategoryOnClick;
  final int currentTopCategoriesIndex;
  final List favourites;
  final Function(ItemModel model) itemCardViewUpdateFavourites;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            getScreenPart1(context),
            getScreenPart2(),
            getScreenPart3(),
            getScreenPart4(),
            getScreenPart5(context),
            getScreenPart6(),
            getScreenPart7(),
          ],
        ),
      ),
    ));
  }

  Widget getScreenPart1(BuildContext context) => Padding(
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
        itemCount: offersNumber,
        itemBuilder: (context, index) {
          return HomeOfferViewItem(
            backColor1: colors[index][0],
            backColor2: colors[index][1],
            btnColor: Colors.white,
            currentIndex: index,
            offersNumber: offersNumber,
            offerImages: offerImages,
          );
        },
      ));

  Widget getScreenPart5(BuildContext context) => Padding(
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
              color: Colors.white,
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
                                                color: orangeColor,
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
                        color: orangeColor,
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
}
