import 'package:flutter/material.dart';

import '../features/presentations/drawer.dart';

/// مدیر تولید

class ProductionManager extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      body: Center(
          child:Text("مدیر تولید")
      ),
    );
  }
}
