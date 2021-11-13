import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:textract/services/ocr.dart';

class Choice extends StatefulWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  File? image;

  captureImageFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile.toString()=='null') {
      Navigator.popAndPushNamed(context, '/choice');
    } else {
      File image = File(pickedFile!.path);
      setState(() {
        this.image = image;
      });
      Navigator.pushReplacementNamed(context, '/preview', arguments: {
        'image': image,
      });
    }
  }

  pickImageFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile.toString() == 'null') {
      Navigator.popAndPushNamed(context, '/choice');
    } else {
      File image = File(pickedFile!.path);
      setState(() {
        this.image = image;
      });
      if (image.isAbsolute) {
        Navigator.pushReplacementNamed(context, '/preview', arguments: {
          'image': image,
        });
      }
    }
    // this.image = image;
    // setState(() {
    //   image;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(181, 2, 1, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Take a picture from",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    captureImageFromCamera();
                  },
                  child: Container(
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.black, width: 2),
                      color: const Color.fromRGBO(209, 54, 51, 1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "./assets/clic.png",
                              fit: BoxFit.cover,
                              width: 120,
                            ),
                          ),
                          const Text(
                            "From Camera",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pickImageFromGallery();
                    // Navigator.popAndPushNamed(context, '/preview',arguments: {
                    //   'image': image,
                    // });
                  },
                  child: Container(
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.black, width: 2),
                      color: const Color.fromRGBO(209, 54, 51, 1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              "./assets/gallery.png",
                              fit: BoxFit.cover,
                              width: 120,
                            ),
                          ),
                          const Text(
                            "From Gallery",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
