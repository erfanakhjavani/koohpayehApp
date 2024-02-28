import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presentions/area_supervisor/seller_add.dart';




class editShopController extends GetxController{


  RxList<CardWidget> cards = <CardWidget>[CardWidget()].obs;

  late CardWidget card;
  List<bool> isSelected = [false, false, false, false];

  void readEdit(){
    final TextEditingController nameStoreController = TextEditingController();
    final TextEditingController nameMalekController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController virphoneController = TextEditingController();
    final TextEditingController metrazhController = TextEditingController();
    final TextEditingController historyController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
  }



@override
  void onInit() {
    super.onInit();
  }


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