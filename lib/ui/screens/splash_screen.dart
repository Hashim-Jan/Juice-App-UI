import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutteruitask/constants/colors.dart';
import 'package:flutteruitask/constants/fonts.dart';
import 'package:flutteruitask/models/juice_data_model.dart';
import 'package:flutteruitask/ui/screens/juice_detail.dart';
import 'package:flutteruitask/widgets/fruit_icons.dart';
import 'package:flutteruitask/widgets/juice_list.dart';
import 'package:flutteruitask/widgets/text_field.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  ///
  /// Bottom Sheet
  /// Add new Juice
  ///
  Widget buildBottomSheet( BuildContext context){
    return Container(
      decoration: BoxDecoration(
          color: appBarColor,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30) )
      ),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Consumer<JuiceModel>(
        builder: (context,model,child){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Text("Add Juice",style: fontSizeTitle,), ),
              SizedBox(height: 20,),
              Text("Juice Name",style: fontSize16,),
              SizedBox(height: 5,),
              CustomTextField(onChange: (value){
                model.addJuice.title=value;
              },
              ),
              SizedBox(height: 20,),
              Text("Juice Description",style: fontSize16,),
              SizedBox(height: 5,),
              CustomTextField(
                onChange: (value){
                  model.addJuice.description=value;
                },
              ),
              SizedBox(height: 20,),
              Text("Juice Price",style: fontSize16,),
              SizedBox(height: 5,),
              CustomTextField(
                onChange: (value){
                  model.addJuice.price=value;
                },
              ),
              SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () => model.addNewJuice(),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(child: Text("Save",style: fontSizeTitle,)),
                  ),
                ),
              )
            ],
          );
        },
      )
      );
  }


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
                    child: FlatButton(
                      onPressed: (){
                        showModalBottomSheet(context: context,isScrollControlled: true, builder: buildBottomSheet);
                      },
                      child: Icon(Icons.more_vert,color: iconColor,),
                    ),
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

    final model  = Provider.of<JuiceModel>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 280.0),
      child: Container(
          padding: EdgeInsets.only(top: 0.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
              ///
              /// The itemCount parameter decides how many times the callback function in itemBuilder will be called.
              ///
              itemCount: model.juicesList.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>JuiceDetail(
                      juiceTitle:  model.juicesList[index].title,
                      juiceDescription:  model.juicesList[index].description,
                      juicePrice:  model.juicesList[index].price,
                      juiceImage:  model.juicesList[index].image,
                    )));
                  },
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(child: JuiceList( model.juicesList[index].title,  model.juicesList[index].description,  model.juicesList[index].price,  model.juicesList[index].image, model.juicesList[index].indexNo),),
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
                                    child: index<=1?Image.asset("images/juiceimage.png",
                                      height:MediaQuery.of(context).size.height * 0.18,
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      fit: BoxFit.fill,
                                    ):ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child:Image.asset("images/juiceimage.png",
                                          height:MediaQuery.of(context).size.height * 0.18,
                                          width: MediaQuery.of(context).size.width * 0.35,
                                          fit: BoxFit.fill,
                                        )
                                    ),
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

