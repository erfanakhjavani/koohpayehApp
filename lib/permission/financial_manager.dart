import 'package:flutter/material.dart';
import 'package:koohpayeh/features/presentations/drawer.dart';

/// مدیر مالی

class FinancialManager extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      body: Center(
          child:Text("مدیر مالی")
      ),
    );
  }
}