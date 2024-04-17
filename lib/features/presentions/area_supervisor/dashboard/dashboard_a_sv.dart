import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/list_store/product_order.dart';
import 'package:koohpayeh/features/presentions/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';



class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('عسل کوهپایه', style: appbar),
        centerTitle: true,
        backgroundColor: base_color,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return Center(
            child: SelectCard(choice: choices[index],),
          );
        }),
      ),
    );
  }
}

class Choice {
  const Choice({this.ontap, this.page, required this.color, required this.title, required this.svg});
  final String title;
  final String svg;
  final Color color;
  final dynamic page;
  final dynamic ontap;
}

 List<Choice> choices =  [
   Choice
    (
      title: 'لیست قیمت ها',
      svg: "honeycreate",
      color: Colors.amber,
      page: ProductPage()
    ),
   Choice
    (
      title: 'گزارشات',
      svg: "reports",
      color: base_colorli
  ),


   Choice
    (
      title: 'پیگیری سفارشات',
      svg: "sell",
      color: Colors.blueGrey
  ),


   Choice
    (
      title: 'سایت کارکنان کوهپایه',
      svg: "logo",
      color: base_color,
      ontap: launchURL
  ),
];

class SelectCard extends StatelessWidget {
  const SelectCard({required this.choice});
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: choice.ontap != null ? choice.ontap
          :() {
           Get.to(choice.page);
      },
      child: Card(
        color: Colors.white,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: SvgPicture.asset("assets/images/${choice.svg}.svg",width: 100,color: choice.color,)),
                Text(choice.title,style: titleg2,),
                SizedBox(height: 5,),

              ]
          ),
        ),
      ),
    );
  }

}
launchURL() async {
  const url = 'https://www.google.com';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(
      url,
    );
  } else {
    throw 'Could not launch $url';
  }
}

