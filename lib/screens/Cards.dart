import 'package:dsc_training_project/bloc_cubit/e_commerce_cubit.dart';
import 'package:dsc_training_project/models/item_model.dart';
import 'package:dsc_training_project/screens/HomePage.dart';
import 'package:dsc_training_project/screens/product_screen.dart';
import 'package:dsc_training_project/widgets/cards_widgets/cards_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';


List<ItemModel>orderdList=[];

class Cards extends StatefulWidget {
  static String id = "cards";

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {

  @override
  void initState() {
    ECommerceCubit.get(context).sum=0;
    for(int i=0 ; i<cartItems.length ; i++){
    int p=int.parse(cartItems[i].price);
    int c= ECommerceCubit.get(context).myCounterList[i];
    ECommerceCubit.get(context).sum=(ECommerceCubit.get(context).sum+p*c);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'My Cart',
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
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
              child: cartItems.length!=0 ? ListView.builder(
                itemCount: cartItems.length,
                  itemBuilder: (context , index){
                  return CartItem(index: index);
                  }
                  ): Center(child: Image.asset('assets/images/freecart.png'),),
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
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '${ECommerceCubit.get(context).sum}\$',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: defaultOrangeColor),
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
                      onPressed: () {
                        setState(() {
                          orderdList.clear();
                          orderdList.addAll(cartItems);
                          /// show dialog
                           dialog(context);
                        });
                        },
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


