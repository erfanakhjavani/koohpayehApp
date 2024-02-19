import 'package:get/get.dart';
import '../../model/SellUserModel/storeListModel.dart';

class listShopController extends GetxController{
  var users = <storeListModel>[].obs;

  @override
  void onInit() {
    users.addAll([
      storeListModel(id: "1",
          storeName: 'محصولات ارگانیک',
          malekName: "حسینی",
          metraj: "15",
          phone: "09159831747",
          sabeghe: "20",
          VitPhone: "09159831747"),
      storeListModel(id: "2",
          storeName: 'محصولات ارگانیک',
          malekName: "حسینی",
          metraj: "15",
          phone: "09159831747",
          sabeghe: "20",
          VitPhone: "09159831747"),
    ]);
  }


  void deleteUser(storeListModel user) {
    users.remove(user);
    update();
  }
}