import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Fetching extends StatefulWidget {
  const Fetching({Key? key}) : super(key: key);

  @override
  _FetchingState createState() => _FetchingState();
}

class _FetchingState extends State<Fetching> {
  File? image;
  final String msg = "Fetching Reviews";
  var data;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    
    Future getFeedBack() async {
      await Firebase.initializeApp();
      data = await FirebaseFirestore.instance.collection('Feedbacks').get();
      // print(data.length);
      setState(() {
      data = data.docs;
      flag = true;
      });
    }

    void gotoViewFeedback() async {
      // String text = 'none';
      // print('text: $text');
      // if(text.isEmpty){
      //   print('empty');
      // }
      await getFeedBack();
      await Future.delayed(const Duration(seconds: 2), () async {
        // String text = await getText();
        Navigator.popAndPushNamed(context, '/viewfeed', arguments: {
          'data': data,
          'flag': flag,
        });
      });
    }

    setState(() {
      gotoViewFeedback();
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
            const SizedBox(
              height: 20,
            ),
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
