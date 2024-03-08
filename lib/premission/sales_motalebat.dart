import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/controller/area_supervisor_controller/list_shop_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../features/presentions/drawer.dart';
import '../features/presentions/text_style.dart';
import '../login.dart';
import '../model/shared_pref.dart';

import '../features/presentions/drawer.dart';

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
