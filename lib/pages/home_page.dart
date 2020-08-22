import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_ui_food_delivery/core/constans.dart';
import 'package:flutter_ui_food_delivery/core/flutter_icons.dart';
import 'package:flutter_ui_food_delivery/models/food_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final foodList = FoodModel.list;
  final pageController = PageController(viewportFraction: .6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            _customAppBar(),

            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [

                  Container(
                    height: 300,
                    child: PageView.builder(
                      controller: pageController,
                      physics: BouncingScrollPhysics(),
                      itemCount: foodList.length,
                      itemBuilder: ( _, index ){
                        return Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Stack(
                            children: [

                              _buildCardsFood(index),

                              Align(
                                alignment: Alignment.topRight,
                                child: Transform.rotate(
                                  angle: pi / 3,
                                  child: Image(
                                    width: 170.0,
                                    image: AssetImage('assets/images/${foodList[index].imgPath}'),
                                  ),
                                ),
                              ),

                              Positioned(
                                bottom: 0,
                                right: 25,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.redColor,
                                    borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  child: Text(
                                    '\$${foodList[index].price.toInt()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 16,),

                  _buildPopularList()

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _buildCardsFood(int index) {
    return Container(
      margin: EdgeInsets.only( top: 40, bottom: 15, right: 40),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(child: SizedBox(),),

          Container(
            height: 90.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [

                    RatingBar(
                      initialRating: 3.6,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 12,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.black,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),

                    SizedBox( width: 10,),

                    Text(
                      '(120 Reviews)',
                      style: TextStyle(
                        fontSize: 12.0
                      ),
                    )

                  ],
                ),

                Text(
                  foodList[index].name,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                  ),
                )

              ],
            ),
          ),

        ],
      ),
    );
  }

  ListView _buildPopularList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 40.0),
      itemCount: foodList.length,
      itemBuilder: ( _, index ){
        return Container(
          padding: EdgeInsets.all(16),
          height: 120.0,
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: AppColors.greenColor.withOpacity(.3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15)
            )
          ),
          child: Row(
            children: [

              Image(
                width: 100,
                image: AssetImage(
                  'assets/images/${foodList[index].imgPath}'
                ),
              ),

              SizedBox( width: 15,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    foodList[index].name,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),

                  SizedBox( height: 5,),

                  Row(
                    children: [

                      Text(
                        '\$${foodList[index].price.toInt()}',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.redColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      SizedBox( width: 15,),

                      Text(
                        '${foodList[index].weight.toInt()} gm Weight',
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),

                    ],
                  )

                ],
              )

            ],
          ),
        );
      },
    );
  }

  Widget _customAppBar(){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [

          RichText(
            text: TextSpan(
              text: 'Hello,\n',
              style: TextStyle(
                color: Colors.black
              ),
              children: [

                TextSpan(
                  text: 'Shailee Weedly,',
                  style: TextStyle(
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold
                  )
                )
                
              ]
            ),
          ),

          SizedBox( width: 16,),

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.greenLightColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [

                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search"
                      ),
                    ),
                  ),
                  
                  Icon( 
                    FlutterIcons.search,
                    size: 16,
                  )


                ],
              ),
            ),
          ),

          SizedBox( width: 16,),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: Icon( FlutterIcons.shop),
            ),
          ),

        ],
      ),
    );
  }
}