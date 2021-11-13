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
  // ignore: non_constant_identifier_names
  int mobile_number = 0;
  late int rating;
  String description = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Rate Us",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xFF1B1B1B),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildUsername(),
            const SizedBox(height: 25),
            buildEmail(),
            const SizedBox(height: 25),
            buildPhone(),
            const SizedBox(height: 25),
            ReviewSlider(
                optionStyle: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                onChange: (int value) {
                  // print(value);
                  rating = value + 1;
                }),
            const SizedBox(height: 5),
            buildFeedback(),
            const SizedBox(
              height: 15,
            ),
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
      validator: (String? value) {
        if (value.toString() == '') {
          username = "Anonymous";
          return null;
        }
      });
  Widget buildEmail() => TextFormField(
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
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
            borderSide: const BorderSide(color: Colors.red)),
        labelStyle: TextStyle(color: Colors.grey[300]),
      ),
      onChanged: (value) => setState(() => email = value),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Email cannot be empty";
        } else {
          if (!value.contains(RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$'))) {
            return "This is not a valid Email";
          } else {
            return null;
          }
        }
      });
  Widget buildPhone() => TextFormField(
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
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
            borderSide: const BorderSide(color: Colors.red)),
        labelStyle: TextStyle(color: Colors.grey[300]),
      ),
      onChanged: (value) => setState(() {
            if (value.isNotEmpty) {
              mobile_number = int.parse(value);
            }
          }),
      validator: (String? value) {
        if (value!.isNotEmpty) {
          if (!value.contains(RegExp(r'^[789]\d{9}$'))) {
            return "This is not a valid Phone Number";
          } else {
            return null;
          }
        } else {
          return null;
        }
      });

  // Widget buildFeedback() => TextFormField(
  //   style: TextStyle(color: Colors.white),
  //   maxLines: null,
  //   keyboardType: TextInputType.multiline,
  // );
  Widget buildFeedback() => Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color(0xFF1B1B1B),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 7, 10, 0),
        child: TextField(
          maxLength: 370,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          style: const TextStyle(color: Colors.white),
          maxLines: 10,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Have something to say about our app..",
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),
          onChanged: (value) {
            setState(() {
              description = value;
            });
          },
        ),
      ));

  Widget buildSubmit() => TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10.0),
          primary: Colors.white,
          backgroundColor: Colors.red,
          textStyle: const TextStyle(fontSize: 18),
        ),
        child: const Text("Submit"),
        onPressed: () async {
          await validator();
        },
      );

  Future<void> validator() async {
    if (formKey.currentState!.validate()) {
      await Navigator.popAndPushNamed(context, '/submitting', arguments: {
        'name': username,
        'email': email,
        'number': mobile_number,
        'rating': rating,
        'details': description,
      });
    }
  }
}
