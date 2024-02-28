
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import '../../../api/list_store_api.dart';
import '../../../model/area_supervisor_model/storeListModel.dart';


class listShopController extends GetxController{
  var users = <storeListModel>[].obs;
  late Future<List<storeListModel>> futureStores;
  String searchValue = '';


  @override
  void onInit() {
    super.onInit();
    futureStores = getData();
    update();
  }



void search(value){
  searchValue = value;
  update();
}



  Future<List<storeListModel>> fetchData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw Exception('No Internet');
    }
    return getData();
  }
  void deleteUser(storeListModel user) {
    users.remove(user);
    update();
  }
}
