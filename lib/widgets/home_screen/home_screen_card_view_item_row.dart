
import 'package:dsc_training_project/models/item_model.dart';
import 'package:dsc_training_project/widgets/home_screen/home_screen_card_view_item.dart';
import 'package:flutter/material.dart';

class HomeCardViewItemRow extends StatelessWidget {
  const HomeCardViewItemRow(
      {Key? key,
      required this.model1,
      this.model2,
      this.model3,
      required this.index1,
      this.index2,
      this.index3,
      required this.num,
      required this.isLastItem,
      required this.isOriented,
      this.isLastTwoItems,
      required this.favourites,
      required this.itemCardViewUpdateFavourites})
      : super(key: key);

  final ItemModel model1;
  final ItemModel? model2;
  final ItemModel? model3;
  final int index1;
  final int? index2;
  final int? index3;
  final int num;
  final bool isLastItem;
  final bool isOriented;
  final bool? isLastTwoItems;
  final List favourites;
  final Function(ItemModel model) itemCardViewUpdateFavourites;

  @override
  Widget build(BuildContext context) {
    if (num == 2) {
      if (isLastTwoItems != null && isLastTwoItems == true) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeCardViewItem(
              isLastItem: isLastItem,
              isLastTwoItems: isLastTwoItems,
              favourites: favourites,
              updateFavouriteData: itemCardViewUpdateFavourites,
              model: model1,
            ),
            HomeCardViewItem(
              isLastItem: isLastItem,
              isLastTwoItems: isLastTwoItems,
              favourites: favourites,
              updateFavouriteData: itemCardViewUpdateFavourites,
              model: model2!,
            )
          ],
        );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: HomeCardViewItem(
            isLastItem: isLastItem,
            isLastTwoItems: isLastTwoItems,
            favourites: favourites,
            updateFavouriteData: itemCardViewUpdateFavourites,
            model: model1,
          )),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: HomeCardViewItem(
            isLastItem: isLastItem,
            isLastTwoItems: isLastTwoItems,
            favourites: favourites,
            updateFavouriteData: itemCardViewUpdateFavourites,
            model: model2!,
          ))
        ],
      );
    } else if (num == 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: HomeCardViewItem(
            isLastItem: isLastItem,
            favourites: favourites,
            updateFavouriteData: itemCardViewUpdateFavourites,
            model: model1,
          )),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: HomeCardViewItem(
            isLastItem: isLastItem,
            favourites: favourites,
            updateFavouriteData: itemCardViewUpdateFavourites,
            model: model2!,
          )),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: HomeCardViewItem(
            isLastItem: isLastItem,
            favourites: favourites,
            updateFavouriteData: itemCardViewUpdateFavourites,
            model: model3!,
          ))
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeCardViewItem(
            isLastItem: isLastItem,
            favourites: favourites,
            updateFavouriteData: itemCardViewUpdateFavourites,
            model: model1,
          )
        ],
      ),
    );
  }
}
