import 'package:flutter/material.dart';

class Juice{
  String title;
  String description;
  var price;
  final image;
  final indexNo;
  Juice({this.title,this.description,this.price,this.image,this.indexNo});
}



class JuiceModel extends ChangeNotifier{

  Juice addJuice=Juice();

  List <Juice> juicesList= [
    Juice(
      title: 'Apple Juice',
      description: ' Almost every designer awaitos their turn and chance work own big food',
      price: 12.65,
      image: 'images/juiceimage.png',
      indexNo: 0,
    ),
    Juice(
      title: 'Mango Juice',
      description: ' Almost every designer awaitos their turn and chance work own big food',
      price: 11.35,
      image: 'images/juiceimage.png',
      indexNo: 1,
    ),
  ];
  ///
  /// Add new juice to list
  ///
  void addNewJuice()
  {
    juicesList.add(addJuice);
    notifyListeners();
    addJuice=Juice();

  }
  ///
  /// Favorite
  ///
bool favoriteIcon=false;
  void myFavourite()
  {
    if(favoriteIcon==false)
      favoriteIcon=true;
    else
      favoriteIcon=false;
      notifyListeners();
  }
  ///
  /// increase or decrease juice quantity
  ///
  int incrementDecValue=0;
  void increment()
  {
    incrementDecValue++;
    notifyListeners();
  }

  void decrement()
  {
    if(incrementDecValue<=0){
      incrementDecValue=0;
    }else
    incrementDecValue--;
    notifyListeners();
  }
}