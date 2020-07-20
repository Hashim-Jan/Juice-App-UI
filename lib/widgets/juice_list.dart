import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutteruitask/constants/colors.dart';
import 'package:flutteruitask/models/juice_data_model.dart';
import 'package:provider/provider.dart';

class JuiceList extends StatelessWidget {
final juiceTitle,juicePrice,juiceDescription,juiceImage,itemIndex;
JuiceList(this.juiceTitle,this.juiceDescription,this.juicePrice,this.juiceImage,this.itemIndex);
  @override
  Widget build(BuildContext context) {
    ///
    /// Juice lists
    ///
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            height:MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(juiceTitle.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8),
                  child: Text(juiceDescription),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                   Row(
                     children: <Widget>[
                       Text("\$"),
                       Text(juicePrice.toString(),style: TextStyle(fontSize: 24)),
                     ],
                   ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                          color: appBarColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                              onTap: ()=>Provider.of<JuiceModel>(context,listen: false).decrement(),
                              child: Icon(Icons.remove,color: iconColor,size: 30)),
                            Consumer<JuiceModel>(
                              builder:(context, model, child){
                                return Text("${model.incrementDecValue}",style: TextStyle(fontSize: 24,color: Colors.white),);
                              },),
                          GestureDetector(
                              onTap: ()=>Provider.of<JuiceModel>(context,listen: false).increment(),
                              child: Icon(Icons.add,color: iconColor,size: 30,))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//List<JuiceDetailsClass> juiceDetails = [appleJuice,grapesJuice,mangoJuices];
//
//final JuiceDetailsClass appleJuice = JuiceDetailsClass(
//    title: 'Apple Juice',
//    description: ' Almost every designer awaitos their turn and chance work own big food',
//    price: '12.65',
//    image: 'images/juiceimage.png',
//    indexNo: 0
//);
//
//final JuiceDetailsClass grapesJuice = JuiceDetailsClass(
//    title: 'Grapes Juice',
//    description: 'Almost every designer awaitos their turn and chance work own big food',
//    price: '11.27',
//    image: 'images/juiceimage.png',
//    indexNo: 1
//);
//
//final JuiceDetailsClass mangoJuices = JuiceDetailsClass(
//    title: 'Mango Juice',
//    description: 'Almost every designer awaitos their turn and chance work own big food',
//    price: '13.65',
//    image: 'images/juiceimage.png',
//    indexNo: 2
//);