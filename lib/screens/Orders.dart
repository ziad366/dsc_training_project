import 'package:dsc_training_project/screens/Cards.dart';
import 'package:dsc_training_project/widgets/orders_widgets/orders_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  static String id = "Orders";

  Orders({Key? key,}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'My Orders',
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: orderdList.length !=0 ? ListView.builder(
        itemCount: orderdList.length,
          itemBuilder: (context,index){
          return OrderdItem(index:index,item: orderdList[index]);
          },
      ): Center(child: Image.asset('assets/images/cart.pn'),),
    );
  }
}


