import 'package:flutter/material.dart';
import 'package:koohpayeh/login.dart';
import 'package:koohpayeh/permission/area_supervisor.dart';
import 'package:koohpayeh/permission/financial_manager.dart';
import 'package:koohpayeh/permission/production_manager.dart';
import 'package:koohpayeh/permission/repartition_manager.dart';
import 'package:koohpayeh/permission/sales_expert.dart';
import 'package:koohpayeh/permission/sales_manager.dart';
import 'package:koohpayeh/permission/sales_motalebat.dart';
import 'package:koohpayeh/permission/super_admin.dart';





Widget navigateUserBasedOnRole(String roleId, BuildContext context) {
  switch (roleId) {
    ///  مدیر ارشد
    case 'superAdmin':
      return SuperAdmin();

    /// مدیر فروش
    case 'salesManager':
      return SalesManager();
      ;

    /// مامور مطالبات
    case 'salesMotalebat':
      return SalesMotalebat();

    /// سرپرست فروش در منطقه
    case 'areaSupervisor':
      return AreaSupervisor();

    /// کارشناس فروش
    case 'salesٍExpert':
      return SelesExpert();

    /// مدیر مالی
    case 'financialManager':
      return FinancialManager();

    /// مدیر تولید
    case 'productionManager':
      return ProductionManager();

    /// مدیر توزیع
    case 'repartitionManager':
      return RepartitionManager();

    default:
      return Login();
  }
}