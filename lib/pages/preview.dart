import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Preview extends StatefulWidget {
  const Preview({Key? key}) : super(key: key);


  @override
  State<Preview> createState() => _PreviewState();
}
class _PreviewState extends State<Preview> { 

  void showError(){
      Fluttertoast.showToast(
        msg: 'You must convert to Text before performing this action.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
    }

  Map data = {};

  @override
  Widget build(BuildContext context) {

    if (data.isNotEmpty) {
      data = data;
    } else {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    }
    File image = data['image'];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(181, 2, 1, 1),
      appBar: AppBar(
        title: const Text(
          'SELECTED PICTURE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  color: Colors.white,
                  height: 580,
                  width: 380,
                  child:Image.file(image,height: 580,width: 380,),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
          // icon: Image.asset( "./assets/imgtext.png",
          // fit: BoxFit.contain,
          // height: 40,
          // width: 40,),
          icon: const Icon(Icons.image),
          backgroundColor: const Color.fromRGBO(209, 54, 51, 1),
          label: const Text('Convert'),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/extracting',arguments: {
              'image': image,
            });
          }),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        color: Colors.black,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                tooltip: 'New Image',
                icon: const Icon(Icons.camera_alt, color: Colors.white),
                onPressed: () {Navigator.popAndPushNamed(context, '/choice');},
              ),
              IconButton(
                tooltip: 'Save as Text',
                icon: const Icon(Icons.save, color: Colors.white),
                onPressed: showError,
              ),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                tooltip: 'Copy to Clipboard',
                icon: const Icon(Icons.copy, color: Colors.white),
                onPressed: showError,
              ),
              IconButton(
                tooltip: 'Translate',
                icon: const Icon(Icons.rate_review, color: Colors.white),
                onPressed: () {Navigator.popAndPushNamed(context, '/feedback');},
              )
            ],
          ),
        ),
      ),
    );
  }
}
