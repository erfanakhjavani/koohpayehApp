import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/text_style.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
 final String image;
 final String name;


 ImageViewer(this.image,this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: (){Get.back();},icon:Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text(name,style: titleW2,),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage("https://crm.koohpayeh.co/storage/images/$image"),
        ),
      ),
    );
  }
}
