import 'dart:io';
import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:textract/pages/error_network.dart';

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
  bool internet = false;
  late StreamSubscription<ConnectivityResult> syncer;

  @override
  Future<void> connection1() async {
    bool previous = internet;
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        internet = true;
      } else {
        internet = false;
      }
    } on Exception catch (_) {
      setState(() {
        internet = false;
      });
    }
    if (previous != internet) {
      setState(() {
        // internet ? Feed() : null;
        internet = internet;
        
      });
      // print(internet);
    }
  }

    Future<void> connection2() {
    return connection1();
  }

  Future<void> connection() async {
    var Result = await (Connectivity().checkConnectivity());
    if (Result == ConnectivityResult.mobile) {
      return connection2();
    } else if (Result == ConnectivityResult.wifi) {
      return connection2();
    } else {
      setState(() {
        internet = false;
      });
    }
  }

  Future<void> _connection_change(ConnectivityResult result) async {
    connection();
  }

  dispose() {
    super.dispose();
    syncer.cancel();
  }

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

    gotoViewFeedback() async {
      // String text = 'none';
      // print('text: $text');
      // if(text.isEmpty){
      //   print('empty');
      // }
      await connection();
      if(internet == false){
        Navigator.popAndPushNamed(context, '/errornetwork');
      } 
      await getFeedBack();
      await Future.delayed(const Duration(seconds: 1), () async {
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
