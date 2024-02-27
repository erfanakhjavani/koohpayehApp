import 'package:get/get.dart';
import '../../presentions/area_supervisor/seller_add.dart';




class createShopController extends GetxController{


  RxList<CardWidget> cards = <CardWidget>[CardWidget()].obs;

  late CardWidget card;
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