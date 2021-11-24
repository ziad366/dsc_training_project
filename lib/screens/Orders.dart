import 'package:dsc_training_project/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Orders extends StatefulWidget {
  static String id = "Orders";

  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  List orderdList = List.generate(3, (index) {
    return OrderdItem();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text('My Orders',),
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
                itemCount: orderdList.length,
                itemBuilder: (context, index) {
                  return orderdList[index];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class OrderdItem extends StatelessWidget {
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
            Expanded(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Apple Watch Series 3',
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Size :36',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '140\$',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount 1',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Row(
                          children: [
                            Text(
                              'Shipped',
                              style:Theme.of(context).textTheme.headline5,
                            ),
                            const SizedBox(width: 5,),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                           // Icons.local_shipping_outlined,color: Theme.of(context).iconTheme.color,),
                                Icons.check_circle,color: Colors.green,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
