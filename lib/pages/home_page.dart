import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery/core/constans.dart';
import 'package:flutter_ui_food_delivery/core/flutter_icons.dart';
import 'package:flutter_ui_food_delivery/models/food_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final foodList = FoodModel.list;

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

                  Text('Build pageview'),
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

  ListView _buildPopularList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 40.0),
      itemCount: foodList.length,
      // scrollDirection: Axis.horizontal,
      itemBuilder: ( _, index ){
        return Container(
          padding: EdgeInsets.all(16),
          height: 120.0,
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
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