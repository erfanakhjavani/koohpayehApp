import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'package:koohpayeh/features/presentions/style.dart';

import 'package:koohpayeh/model/shared_pref.dart';


class Dashboard extends GetView<shareData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'عسل کوهپایه',
            style: appbar,
          ),
          centerTitle: true,
          backgroundColor: base_color,
          elevation: 1.5,
        ),
        body: Center(
                    child: Text('dashboard')
                  ),

                );

  }
}
