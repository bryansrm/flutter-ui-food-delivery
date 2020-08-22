import 'package:flutter/material.dart';
import 'package:flutter_ui_food_delivery/core/constans.dart';
import 'package:flutter_ui_food_delivery/core/flutter_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            _customAppBar(),

            

          ],
        ),
      ),
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
                  
                  Icon( Icons.search)


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