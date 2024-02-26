import 'package:flutter/material.dart';
import 'package:koohpayeh/features/sell_user/seller_add.dart';
import 'package:koohpayeh/features/sell_user/store_list.dart';
import 'package:koohpayeh/login.dart';
import 'package:koohpayeh/premission/sell_user.dart';
import 'package:koohpayeh/premission/superAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';







Widget navigateUserBasedOnRole(String roleId, BuildContext context) {
  switch (roleId) {
    ///  مدیر ارشد
    case '1':
      return superAdmin();
      ///
    case '2':
      return createSeller();;
    case '3':
      return Sell_user();
    case '4':
      return Store_list();
    case '5':
      return Login();
    case '6':
      return Login();
    default:
      return Login();
  }
}
Future<String> get_role() async {
  final prefs = await SharedPreferences.getInstance();
  final logeedrole = prefs.getString('role_id') ?? '';
  return logeedrole;
}