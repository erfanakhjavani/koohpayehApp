// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   List<User> _users = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUsers();
//   }
//
//   void _fetchUsers() async {
//     final response = await http.get(Uri.parse('https://example.com/api/users'));
//
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       setState(() {
//         _users = jsonResponse.map((user) => User.fromJson(user)).toList();
//       });
//     } else {
//       throw Exception('Failed to load users from API');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('جدول با داده های سرور'),
//         ),
//         body: DataTable(
//           columns: const <DataColumn>[
//             DataColumn(
//               label: Text(
//                 'نام',
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               ),
//             ),
//             DataColumn(
//               label: Text(
//                 'فامیل',
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               ),
//             ),
//             DataColumn(
//               label: Text(
//                 'سن',
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               ),
//             ),
//           ],
//           rows: _users.map((user) => DataRow(cells: [
//             DataCell(Text(user.firstName)),
//             DataCell(Text(user.lastName)),
//             DataCell(Text(user.age.toString())),
//           ])).toList(),
//         ),
//       ),
//     );
//   }
// }
//
// class User {
//   final String firstName;
//   final String lastName;
//   final int age;
//
//   User({required this.firstName, required this.lastName, required this.age});
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       firstName: json['firstName'],
//       lastName: json['lastName'],
//       age: json['age'],
//     );
//   }
// }

























import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class UserController extends GetxController {
  var users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    users.addAll([
      User(firstName: 'محمد', lastName: 'رضایی', age: 25),
      User(firstName: 'علی', lastName: 'محمدی', age: 30),
      User(firstName: 'حسین', lastName: 'کریمی', age: 35),
    ]);
  }

  void deleteUser(User user) {
    users.remove(user);
  }
}

class User {
  final String firstName;
  final String lastName;
  final int age;

  User({required this.firstName, required this.lastName, required this.age});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('جدول با GetX'),
        ),
        body: GetBuilder<UserController>(
          init: UserController(),
          builder: (controller) {
            return DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'نام',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'نام خانوادگی',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'سن',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'عملیات',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                controller.users.length,
                    (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(controller.users[index].firstName)),
                    DataCell(Text(controller.users[index].lastName)),
                    DataCell(Text('${controller.users[index].age}')),
                    DataCell(Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditUserScreen(user: controller.users[index])),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => controller.deleteUser(controller.users[index]),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class EditUserScreen extends StatelessWidget {
  final User user;

  EditUserScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ویرایش اطلاعات کاربر'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: TextEditingController(text: user.firstName),
              decoration: InputDecoration(labelText: 'نام'),
            ),
            TextField(
              controller: TextEditingController(text: user.lastName),
              decoration: InputDecoration(labelText: 'نام خانوادگی'),
            ),
            TextField(
              controller: TextEditingController(text: user.age.toString()),
              decoration: InputDecoration(labelText: 'سن'),
            ),
            ElevatedButton(
              onPressed: () {
                // اینجا کد برای ذخیره تغییرات را قرار دهید
              },
              child: Text('ذخیره تغییرات'),
            ),
          ],
        ),
      ),
    );
  }
}
