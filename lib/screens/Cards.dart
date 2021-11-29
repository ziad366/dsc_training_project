import 'package:dsc_training_project/bloc_cubit/e_commerce_cubit.dart';
import 'package:dsc_training_project/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';

class Cards extends StatelessWidget {
  static String id = "cards";


  List x = List.generate(10, (index) {
   return CartItem();
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text('My Cart',),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,),
          onPressed: () {
            Navigator.pushNamed(context, HomePage.id);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: ListView.builder(
                itemCount: x.length,
                itemBuilder: (context, index) {
                  return x[index];
                },
              ),
            ),
          ),
          Container(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '330\$',
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: defaultOrangeColor
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: defaultOrangeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Buy Now',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CartItem extends StatelessWidget {

  const CartItem({Key? key}) : super(key: key);


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
                decoration: BoxDecoration(
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://image.freepik.com/free-psd/front-view-stylish-man-hoodie-with-headphones_23-2148939682.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apple Watch Series 3',
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Size :36',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '140\$',
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
                          ECommerceCubit.get(context).decrementProductNumber();
                        },
                        icon: Center(
                          child: Icon(
                            Icons.remove,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                      Text('${ECommerceCubit.get(context).productNumber}'),
                      IconButton(
                        onPressed: () {
                          ECommerceCubit.get(context).incrementProductNumber();
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


