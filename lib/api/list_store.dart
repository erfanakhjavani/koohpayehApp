import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/SellUserModel/storeListModel.dart';

Future<List<storeListModel>> getData() async {




  var uri = Uri.parse('https://crm.koohpayeh.co/api/store/list');

  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.getString("token");



  final response = await http.get(uri,headers: <String, String>{
    'Authorization': 'Bearer 9|h4uOf4K0hJk2dPpDsDPGarS2emKnqg8ySbpPQm0q7e66d486',
  },);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');



  if (response.statusCode == 200) {
    List<dynamic> list = json.decode(response.body)['data'];
    return list.map((item) => storeListModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
