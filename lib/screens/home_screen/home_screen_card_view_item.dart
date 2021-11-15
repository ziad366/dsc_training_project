import 'package:dsc_training_project/screens/home_screen/item_model.dart';
import 'package:flutter/material.dart';

class HomeCardViewItem extends StatelessWidget {
  const HomeCardViewItem(
      {Key? key,
      required this.isLastItem,
      this.isLastTwoItems,
      required this.model,
      required this.updateFavouriteData,
      required this.favourites})
      : super(key: key);

  final bool isLastItem;
  final bool? isLastTwoItems;
  final ItemModel model;
  final Function(ItemModel model) updateFavouriteData;
  final List favourites;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: isLastItem ? 15 : 0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            //TODO got to item screen
          },
          child: Container(
            width: (isLastTwoItems != null && isLastTwoItems == true)
                ? 280
                : isLastItem
                    ? 220
                    : null,
            height: 280,
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
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white54,
                      ),
                      child: Text(
                        model.isOfferEnabled ? model.offer : "",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    InkWell(
                        onTap: () => updateFavouriteData(model),
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
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 110,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    model.imagePath,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 220,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54,
                  ),
                  child: Column(
                    children: [
                      Text(
                        model.itemName,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.black38),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: model.price,
                          style: TextStyle(
                              fontSize: 20,
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
