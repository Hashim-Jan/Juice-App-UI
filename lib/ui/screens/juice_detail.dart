import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteruitask/constants/colors.dart';
import 'package:flutteruitask/models/juice_data_model.dart';
import 'package:provider/provider.dart';

class JuiceDetail extends StatefulWidget {

  final juiceTitle,juiceDescription,juicePrice,juiceImage;
  JuiceDetail({this.juiceTitle,this.juiceDescription,this.juicePrice,this.juiceImage});

  @override
  _JuiceDetailState createState() => _JuiceDetailState();
}

class _JuiceDetailState extends State<JuiceDetail> {
  @override
  Widget build(BuildContext context) {
    ///
    /// Juice details page and order juice
    ///
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.42,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                      image: DecorationImage(
                        image:AssetImage("images/juiceimage.png",),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap:()=> Navigator.pop(context),
                        child: Container(
                          margin: EdgeInsets.only(left: 20,top: 20),
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white70,
                          ),
                          child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 20,top: 20),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.12,
                            child: Icon(Icons.more_vert,color: Colors.white,),
                          ),
                           Consumer<JuiceModel>(
                            builder: (context,model,child) {
                              return GestureDetector(
                                onTap: () => Provider.of<JuiceModel>(context, listen: false).myFavourite(),
//                              setState(() {
//                                if(favoriteIcon==false)
//                                  favoriteIcon=true;
//                                else
//                                  favoriteIcon=false;
//                              });
                                child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.pink.withOpacity(0.4),
                                            blurRadius: 2.0,
                                            offset: Offset(0, 8),
                                            spreadRadius: 2.0,
                                          )
                                        ]
                                    ),
                                    height: MediaQuery.of(context).size.height * 0.07,
                                    width: MediaQuery.of(context).size.width * 0.12,
                                    child: Center(
                                      child: model.favoriteIcon == true ? Icon(
                                        Icons.favorite,
                                        color: Colors.pinkAccent, size: 30,) :
                                      Icon(Icons.favorite_border,
                                        color: Colors.pinkAccent, size: 30,),
                                    )
                                ),
                              );
                            }
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${widget.juiceTitle}',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Lemonade Juice",style: TextStyle(fontSize: 24)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("\$"),
                          Text(widget.juicePrice.toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.3,
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
                                builder: (context,model,child){
                                  return Text('${model.incrementDecValue}',style: TextStyle(color: iconColor,fontSize: 24),);
                                },
                              ),
                              GestureDetector(
                                  onTap: ()=>Provider.of<JuiceModel>(context,listen: false).increment(),
                                  child: Icon(Icons.add,color: iconColor,size: 30,))
                          ],
                        ),
                      )
                    ],
                  ),
                  Text("About Product",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                  Text("${widget.juiceDescription}"),
                ],
              ),
            ),
            ///
            /// Order button
            ///
            FlatButton(
              onPressed: (){},
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: appBarColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))
              ),
                  height:MediaQuery.of(context).size.height * 0.09 ,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(child: Text("Add to Blog",style: TextStyle(color:Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
