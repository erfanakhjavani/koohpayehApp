
import 'package:get/get.dart';
import 'package:koohpayeh/model/area_supervisor_model/get_area_part_model.dart';
import '../../../api/list_store_api.dart';
import '../../../model/area_supervisor_model/store_list_model.dart';


class listShopController extends GetxController{
  late Future<List<getAreaModel>> futureArea;
  late Future<List<getPartModel>> futurePart;
  late Future<ApiResponseModel>  futureStores;
  String searchValue = '';

  @override
  void onInit() {
    getArea();
    // TODO: implement onInit
    super.onInit();
  }

  void getArea() {
    futureArea = getAreaApi();
    update();
  }

  void getPart(int id){
    futurePart = getPartApi(id);
    update();
  }
  void getStores(int id){
    futureStores = getlistStore(id);
    update();
  }

void search(value){
  searchValue = value;
  update();
}



}
