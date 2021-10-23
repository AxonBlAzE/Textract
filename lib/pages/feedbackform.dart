import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reviews_slider/reviews_slider.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final formKey = GlobalKey<FormState>();
  String username = "";
  String email = "";
  late int number;
  late int rating; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Rate Us", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: const Color(0xFF1B1B1B),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildUsername(),
            SizedBox(height: 25),
            buildEmail(),
            SizedBox(height: 25),
            buildPhone(),
            SizedBox(height: 25),
            ReviewSlider(
                optionStyle: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                onChange: (int value) {
                  print(value);
                  rating = value;
                }),
            const SizedBox(height: 5),
            buildFeedback(),
            const SizedBox(height: 15,),
            buildSubmit(),
          ],
        ),
      ),
    );
  }

  Widget buildUsername() => TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: 'Name/Nickname',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.red)),
          labelStyle: TextStyle(color: Colors.grey[300]),
        ),
        onChanged: (value) => setState(() => username = value),
      );
  Widget buildEmail() => TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: 'Email',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.red)),
          labelStyle: TextStyle(color: Colors.grey[300]),
        ),
        onChanged: (value) => setState(() => email = value),
      );
  Widget buildPhone() => TextFormField(
        style: TextStyle(color: Colors.white),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: 'Phone Number',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.red)),
          labelStyle: TextStyle(color: Colors.grey[300]),
        ),
        onChanged: (value) => setState(() => number = int.parse(value)),
      );

  // Widget buildFeedback() => TextFormField(
  //   style: TextStyle(color: Colors.white),
  //   maxLines: null,
  //   keyboardType: TextInputType.multiline,
  // );
  Widget buildFeedback() => Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color(0xFF1B1B1B),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          style: TextStyle(color: Colors.white),
          maxLines: 10,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Have something to say about our app..",
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),
        ),
      ));

  Widget buildSubmit() => TextButton(
  
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10.0),
            primary: Colors.white,
            backgroundColor: Colors.red,
            textStyle: const TextStyle(fontSize: 18),
        ),
        
        child: Text("Submit"),
        onPressed: () {
          print(username);
          print(email);
          print(number);
          print(rating);
          // FirebaseFirestore.instance.runTransaction((transaction) async {
          //   DocumentSnapshot freshsnap = await transaction.get(document.);
          //   await transaction
          });
      //   },
      // );
}
