import 'package:flutter/material.dart';

class Juice{
  String title;
  String description;
  var price;
  final image;
  int indexNo=0;
  Juice({this.title,this.description,this.price,this.image});
}



class JuiceModel extends ChangeNotifier {

  Juice addJuice = Juice();

  List <Juice> juicesList = [
    Juice(
      title: 'Apple Juice',
      description: ' Almost every designer awaitos their turn and chance work own big food',
      price: 12.65,
      image: 'images/juiceimage.png',
    ),
    Juice(
      title: 'Mango Juice',
      description: ' Almost every designer awaitos their turn and chance work own big food',
      price: 11.35,
      image: 'images/juiceimage.png',
    ),
  ];

  ///
  /// Add new juice to list
  ///
  void addNewJuice() {
    juicesList.add(addJuice);
    notifyListeners();
    addJuice = Juice();
  }

  ///
  /// Favorite
  ///
  bool favoriteIcon = false;

  void myFavourite() {
    if (favoriteIcon == false)
      favoriteIcon = true;
    else
      favoriteIcon = false;
    notifyListeners();
  }

  ///
  /// increase or decrease juice quantity
  ///
  int incrementDecValue = 0;

  void increment(int index) {
//    incrementDecValue++;
    juicesList[index].indexNo++;
    notifyListeners();
  }

  void decrement(int index) {
    if(juicesList[index].indexNo<=0){
      juicesList[index].indexNo=0;
    }else
    juicesList[index].indexNo--;
    notifyListeners();
  }
//    juicesList[index].indexNo--;
//    notifyListeners();

}