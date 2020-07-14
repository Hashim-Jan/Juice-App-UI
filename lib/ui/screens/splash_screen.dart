import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutteruitask/constants/colors.dart';
import 'package:flutteruitask/ui/screens/juice_detail.dart';
import 'package:flutteruitask/widgets/fruit_icons.dart';
import 'package:flutteruitask/widgets/juice_list.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        scrolableBody(context),
        customAppBar(context),
      ],
    );
  }
  ///
  /// Custom AppBar (Search Bar + Foods Cards)
  ///
  Widget customAppBar(context){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              color: appBarColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ///
                  /// Search bar
                  ///
                  Container(
                    margin:EdgeInsets.only(top: 20),
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.height * 0.4,
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search,color:appBarColor,),
                        filled: true,
                        hintText: "Search Juice Name",
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                            color:appBarColor),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,),
                      ),
                    ),
                  ),
                  ///
                  /// More button
                  ///
                  Container(
                    margin:EdgeInsets.only(top: 20),
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: cardColor,
                    ),
                    child: Icon(Icons.more_vert,color: iconColor,),
                  ),
                ],
              ),
              ///
              /// Juice cards categories
              ///
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                margin: EdgeInsets.only(bottom: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FruitIcons("images/1.png","Avocado"),
                    FruitIcons("images/2.png","Mango"),
                    FruitIcons("images/3.png","Apple"),
                    FruitIcons("images/4.png","Grapes"),
                    FruitIcons("images/4.png","Grapes"),
                    FruitIcons("images/4.png","Grapes"),
                    FruitIcons("images/4.png","Grapes"),
                    FruitIcons("images/5.png","Banana"),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
  ///
  /// Scrolable juice list
  ///
  Widget scrolableBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 280.0),
      child: Container(
          padding: EdgeInsets.only(top: 0.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
              itemCount: juiceDetails.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>JuiceDetail(
                      juiceTitle: juiceDetails[index].title,
                      juiceDescription: juiceDetails[index].description,
                      juicePrice: juiceDetails[index].price,
                      juiceImage: juiceDetails[index].image,
                    )));
                  },
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(child: JuiceList(juiceDetails[index].title, juiceDetails[index].description, juiceDetails[index].price, juiceDetails[index].image)),
                          Container(
                            height:MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: index == 0 ? BoxDecoration(
                                color: backColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30))
                            ) : BoxDecoration(
                              color: backColor
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset("images/juiceimage.png",
                                      height:MediaQuery.of(context).size.height * 0.18,
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
    );
  }
}





