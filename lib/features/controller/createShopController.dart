import 'package:get/get.dart';

class createShopController extends GetxController{
  int indexCard = 1;


  void increment(){
    indexCard++;
    update();
  }


  void decrement(){
    indexCard--;
    if (indexCard == 0) {
       indexCard = indexCard + 1;

    }
    update();
  }

}