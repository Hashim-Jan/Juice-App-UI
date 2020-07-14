import 'package:flutter/material.dart';
import 'package:flutteruitask/constants/colors.dart';

class FruitIcons extends StatelessWidget {
  final juiceImage;
  String juiceName;
  FruitIcons(this.juiceImage,this.juiceName);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white
              ),
              child: Image.asset(juiceImage,scale: 8,)
          ),
          SizedBox(height: 10,),
          Text(juiceName,style: TextStyle(color:iconColor,fontWeight: FontWeight.bold),)

        ],
      ),
    );
  }
}