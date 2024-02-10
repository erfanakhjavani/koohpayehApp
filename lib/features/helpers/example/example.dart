import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فرم تکس فیلدها'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'نام'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'آدرس'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'شماره تلفن'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // دریافت مقادیر از تکس فیلدها
                String name = nameController.text;
                String address = addressController.text;
                String phoneNumber = phoneNumberController.text;

                // انجام عملیات مورد نیاز با مقادیر دریافتی
                print('نام: $name');
                print('آدرس: $address');
                print('شماره تلفن: $phoneNumber');
              },
              child: Text('ذخیره'),
            ),
          ],
        ),
      ),
    );
  }
}
