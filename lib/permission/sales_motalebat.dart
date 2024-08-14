import 'package:flutter/material.dart';
import '../features/presentations/drawer.dart';


/// مامور مطالبات

class SalesMotalebat extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      body: Center(
          child:Text("مامور مطالبات")
      ),
    );
  }
}
