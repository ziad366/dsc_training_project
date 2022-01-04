import 'package:dsc_training_project/bloc_cubit/e_commerce_cubit.dart';
import 'package:dsc_training_project/screens/product_screen.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  //ItemModel? model;
  int index;
  CartItem({Key? key,
    required this.index,
    //required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Theme.of(context).cardColor,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Container(
                  height: 100,
                  width: 70,
                  child:  Image.asset('${cartItems[index].imagePath}',)
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cartItems[index].itemName}',
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Size :${yourSizes.containsKey(cartItems[index].id)? yourSizes[cartItems[index].id] : '' } ',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${cartItems[index].price}',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          ECommerceCubit.get(context).decrementProductNumber(index);
                        },
                        icon: Center(
                          child: Icon(
                            Icons.remove,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                      Text('${ECommerceCubit.get(context).myCounterList[index]}'),
                      IconButton(
                        onPressed: () {
                          ECommerceCubit.get(context).incrementProductNumber(index);
                        },
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}