import 'dart:io';
import 'dart:math';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class cameraAgalleryController extends GetxController{

  late File uploadImage;
  String fileName = "";
  bool load = false;


  Future<void> chooseImageC() async {
    final choosedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (choosedImage == null) return null;

    final imageTemp = File(choosedImage.path);

    Random random = new Random();
    int randomNumber = random.nextInt(100000);



      this.uploadImage = imageTemp;
      fileName = "image_" + randomNumber.toString() + ".jpg";
      print("your file name is =" + fileName);
      load = true;
      update();

  }
  Future<void> chooseImageG() async {
    final choosedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (choosedImage == null) return null;

    final imageTemp = File(choosedImage.path);

    Random random = new Random();
    int randomNumber = random.nextInt(100000);



      this.uploadImage = imageTemp;
      fileName = "image_" + randomNumber.toString() + ".jpg";
      print("your file name is =" + fileName);
      load = true;
      update();
  }
}