import 'package:flutter/material.dart';

import '../features/presentations/drawer.dart';

/// مدیر توزیع

class RepartitionManager extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      body: Center(
          child:Text("مدیر توزیع")
      ),
    );
  }
}
