import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cool_alert/cool_alert.dart';

class Submitting extends StatefulWidget {
  const Submitting({ Key? key }) : super(key: key);

  @override
  _SubmittingState createState() => _SubmittingState();
}

class _SubmittingState extends State<Submitting> {
  // final String msg = "Submitting Your Feeback..."; 
  
  @override
  Widget build(BuildContext context) {

    Future<Future> buildSuccessPrompt() async => CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: "Feedback Submitted Successfully!",
      loopAnimation: true,
      confirmBtnText: "OK",
      confirmBtnColor: Colors.red,
      onConfirmBtnTap: () {
        Navigator.popAndPushNamed(context, '/home');
      }
    );

    const String msg = "Submitting Your Feeback...";
    Map data = {};

    if (data.isNotEmpty) {
      data = data;
    } else {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    }

    submit() async {
      await Firebase.initializeApp();
      FirebaseFirestore.instance.collection('Feedbacks').add({
        'name': data['name'],
        'email': data['email'],
        'number': data['number'],
        'rating': data['rating'],
        'details': data['details'],
      });
    }

    void gotoSubmitted() async {
      await submit();
      Future.delayed(const Duration(seconds: 2), () async {
        buildSuccessPrompt();
      });
    }

    setState(() {
      gotoSubmitted();
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SpinKitFoldingCube(
              color: Colors.red,
              size: 50.0,
              duration: Duration(milliseconds: 1200),
            ),
            SizedBox(height: 20,),
            Text(
              msg,
                style: TextStyle(
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


