import 'package:flutter/material.dart';
import 'package:flutteruitask/constants/colors.dart';

class JuiceList extends StatelessWidget {
final juiceTitle,juiceDescription,juicePrice,juiceImage;
JuiceList(this.juiceTitle,this.juiceDescription,this.juicePrice,this.juiceImage);
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
                  child: Text(juiceTitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34),),
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
                       Text(juicePrice,style: TextStyle(fontSize: 24)),
                     ],
                   ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          color: appBarColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.remove,color: iconColor,size: 30),
                          Text("1",style: TextStyle(color: iconColor,fontSize: 24),),
                          Icon(Icons.add,color: iconColor,size: 30,)
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

///
/// Juice Class
///
class JuiceDetailsClass{
  final title;
  final description;
  final price;
  final image;
  JuiceDetailsClass({this.title,this.description,this.price,this.image});
}

List<JuiceDetailsClass> juiceDetails = [appleJuice,grapesJuice,mangoJuices];

final JuiceDetailsClass appleJuice = JuiceDetailsClass(
    title: '  Apple Juice',
    description: ' Almost every designer awaitos their turn and chance work own big food',
    price: '12.65',
    image: 'images/juiceimage.png',
);

final JuiceDetailsClass grapesJuice = JuiceDetailsClass(
    title: '  Grapes Juice',
    description: 'Almost every designer awaitos their turn and chance work own big food',
    price: '11.27',
    image: 'images/juiceimage.png',
);

final JuiceDetailsClass mangoJuices = JuiceDetailsClass(
    title: '  Mango Juice',
    description: 'Almost every designer awaitos their turn and chance work own big food',
    price: '13.65',
    image: 'images/juiceimage.png',
);