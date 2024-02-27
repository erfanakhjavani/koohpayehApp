import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/area_supervisor_model/work_to_do_model.dart';



Future<List<workToDoModel>> getDataWorkToDo() async {




  var uri = Uri.parse('https://crm.koohpayeh.co/api/jobs/list');

  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString('token') ?? '';



  final response = await http.get(uri,headers: <String, String>{
    'Authorization': 'Bearer ' + token.toString(),
  },);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  print(token);


  if (response.statusCode == 200) {
    List<dynamic> list = json.decode(response.body)['data'];
    return list.map((item) => workToDoModel.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
