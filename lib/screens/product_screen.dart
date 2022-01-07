import 'package:dsc_training_project/models/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants.dart';
import 'HomePage.dart';

List <ItemModel> cartItems =[];
List ones=[];
Map <int,int>yourSizes={};

class ProductPage extends StatefulWidget {
  static String id ="ProductPage";

  final ItemModel model;
  ProductPage({required this.model});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

   int x=0;

  List<Sizes> sizesList =[
    Sizes(size: 36 , colored: false),
    Sizes(size: 37 , colored: false),
    Sizes(size: 38 , colored: false),
    Sizes(size: 39 , colored: false),
    Sizes(size: 40 , colored: false),
  ];


  @override
  Widget build(BuildContext context) {
    List items = [
      Image.asset('${widget.model.imagePath}'),
      Image.asset('${widget.model.imagePath}'),
      Image.asset('${widget.model.imagePath}'),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushNamed(context, HomePage.id);
          },
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    color: greyColor,
                    height: MediaQuery.of(context).size.height*0.4,
                    width: double.infinity,
                    child: PageView.builder(
                      itemCount: items.length,
                      controller: controller,
                      itemBuilder: (context,index){
                        return items[index];
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SmoothPageIndicator(
                    count: 3,
                    controller: controller,
                    effect: CustomizableEffect(
                      dotDecoration:  DotDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      activeDotDecoration: DotDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: defaultOrangeColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Text('${widget.model.itemName}',
                    style: Theme.of(context).textTheme.headline3,),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: StarAmberColor,
                          size: 10,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(width: 5,),
                      Text('(4500 Reviews)')
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('${widget.model.price}', style: Theme.of(context).textTheme.headline3,),
                      const SizedBox(width: 5,),
                      Container(
                        child: widget.model.isOfferEnabled==true ? Text('${widget.model.priceBeforeOffer}',
                          style: TextStyle(decoration: TextDecoration.lineThrough,color: greyColor),):null,
                      ),
                      Spacer(),
                      Text('Available in stock',style:Theme.of(context).textTheme.headline5,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text('About',style: Theme.of(context).textTheme.headline3,),
                  const SizedBox(height: 10,),
                  const Text(
                      'Lorem Ipsum is simply dummy text of the printing'
                          ' and typesetting industry. Lorem Ipsum has been the industry\'s'
                          ' standard dummy text ever since the 1500s, when an unknown printer '
                  ),
                  Container(
                    height: 50,
                    child: sizesList != 0
                        ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sizesList.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  sizesList[index].colored=!sizesList[index].colored;
                                  x=index;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: sizesList[index].colored ==true ? Colors.deepOrange.withOpacity(0.5) : null,
                                  borderRadius:  BorderRadius.circular(15),
                                  border: Border.all(color: greyColor),
                                ),
                                child: Text('${sizesList[index].size}',),
                              ),
                            ),
                          );
                        })
                        : const Center(child: CircularProgressIndicator(),),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            cartItems.add(widget.model);
                           yourSizes[widget.model.id] = sizesList[x].size;
                           print(yourSizes);
                            /// show the dialog
                           dialog(context);
                           ones.add(1);

                          },
                          child: Text('Add to cart'),
                          style: ElevatedButton.styleFrom(
                              primary: defaultOrangeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                          ),
                        ),
                      ),
                    ),
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


