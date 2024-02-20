import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sell_user/selleradd.dart';



class createShopController extends GetxController{


  RxList<CardWidget> cards = <CardWidget>[CardWidget()].obs;



  List<bool> isSelected = [false, false, false, false];

  void select(){
    isSelected;
    update();
  }

  void addCard() {
    cards.add(CardWidget());
    update();
  }
  void removeCard(CardWidget card) {
    cards.remove(card);
    update();
  }
  bool validateAll() {
    return cards.every((card) => card.key.currentState!.validate());
  }



}