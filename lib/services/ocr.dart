// import 'dart:html';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class OCR{
  late File image;
  late Future<File> imageFile;
  late ImagePicker imagePicker;


  captureImageFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(source: ImageSource.camera,);
    image = File(pickedFile!.path);
  }

  pickImageFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(source: ImageSource.gallery,);
    image = File(pickedFile!.path);
  }
}