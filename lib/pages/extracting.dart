import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Extracting extends StatefulWidget {
  const Extracting({ Key? key }) : super(key: key);

  @override
  _ExtractingState createState() => _ExtractingState();
}

class _ExtractingState extends State<Extracting> {
  File? image;
  final String msg = "Converting to Text"; 
  
  @override
  Widget build(BuildContext context) {
    
    Map data = {};

    if (data.isNotEmpty) {
      data = data;
    } else {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    }

    File image = data['image'];
    // if(image.isAbsolute){
    //   print('image ok');
    // }

    getText() async {
      final FirebaseVisionImage firebaseVisionImage = FirebaseVisionImage.fromFile(image);
      final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
      VisionText visionText = await recognizer.processImage(firebaseVisionImage);
      String result = '';
      for(TextBlock block in visionText.blocks){
        // final String text = block.text;
        for(TextLine line in block.lines){
          for(TextElement element in line.elements){
            result += element.text+ " ";
          }
        }
        result += "\n"; 
      }
      return result;
    }

    void gotoConverted() async {
      // String text = 'none';
      String text = await getText();
      // print('text: $text');
      // if(text.isEmpty){
      //   print('empty');
      // }
      await Future.delayed(const Duration(seconds: 2), () async {
        // String text = await getText();
        Navigator.popAndPushNamed(context, '/converted', arguments: {
          'text' : text,
        });
      });
    }

    setState(() {
      gotoConverted();
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitFoldingCube(
              color: Colors.red,
              size: 50.0,
              duration: Duration(milliseconds: 1200),
            ),
            const SizedBox(height: 20,),
            Text(
              msg,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                ),
              )
          ],
        ),
      ),
    );
  }
}