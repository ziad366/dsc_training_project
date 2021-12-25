import 'package:dsc_training_project/models/item_model.dart';
import 'package:dsc_training_project/widgets/home_screen/home_screen_card_view_item_row.dart';
import 'package:flutter/material.dart';

class HomeScreenFavouritePage extends StatelessWidget {
  const HomeScreenFavouritePage(
      {Key? key,
      required this.favourites,
      required this.itemCardViewUpdateFavourites,
      required this.scaffoldKey})
      : super(key: key);

  final List favourites;
  final Function(ItemModel model) itemCardViewUpdateFavourites;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    // TODO update this page when update favourites
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            getScreenPart1(context),
            getScreenPart2(),
          ],
        ),
      ),
    ));
  }

  Widget getScreenPart1(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              color: Colors.black12,
              child: InkWell(
                onTap: () {
                  if (scaffoldKey.currentState != null) {
                    scaffoldKey.currentState!.openDrawer();
                  }
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
          ],
        ),
      );

  Widget getScreenPart2() => Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: OrientationBuilder(
          builder: (context, orientation) {
            bool goTriple =
                MediaQuery.of(context).orientation == Orientation.landscape;
            List<Widget> result = [];
            bool isOdd = favourites.length % 2 != 0;
            bool isTriple = favourites.length % 3 != 0;
            int size;
            if (!goTriple)
              size =
                  (!isOdd ? favourites.length / 2 : favourites.length / 2 + 1)
                      .toInt();
            else
              size = (!isTriple
                      ? favourites.length / 3
                      : favourites.length / 3 + 1)
                  .toInt();
            int index = 0;
            for (int i = 0; i < size; i++) {
              if (isTriple && goTriple && i != size - 1) {
                ItemModel model1 = favourites[index];
                int index1 = index;
                index++;
                ItemModel model2 = favourites[index];
                int index2 = index;
                index++;
                ItemModel model3 = favourites[index];
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
                ItemModel model1 = favourites[index];
                int index1 = index;
                index++;
                ItemModel model2 = favourites[index];
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
                ItemModel model1 = favourites[index];
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
