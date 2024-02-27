
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

import '../../../api/work_to_do_api.dart';
import '../../../model/area_supervisor_model/work_to_do_model.dart';

class workToDoController extends GetxController{


  var users = <workToDoModel>[].obs;
  late Future<List<workToDoModel>> futureWTD;

  @override
  void onInit() {
    super.onInit();
    futureWTD = getDataWorkToDo();
    update();
  }

  // Future<List<workToDoModel>> fetchData() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     throw Exception('No Internet');
  //   }
  //   return getDataWorkToDo();
  // }
  void deleteUser(workToDoModel user) {
    users.remove(user);
    update();
  }

}