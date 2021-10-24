import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Viewfeedback extends StatefulWidget {
  const Viewfeedback({Key? key}) : super(key: key);

  @override
  _ViewfeedbackState createState() => _ViewfeedbackState();
}

class _ViewfeedbackState extends State<Viewfeedback> {
  bool flag = false;
  var data;
  @override
  void initState() {
    super.initState();
    Feed();
  }

  // Future Feed() async {
  //   await Firebase.initializeApp();
  //   FirebaseFirestore.instance
  //       .collection('Feedbacks')
  //       .snapshots()
  //       .listen((data_fetch) {
  //     setState(() {
  //       data = data_fetch.docs;
  //       flag = true;
  //     });
  //   });
  // }

  Future Feed() async {
    await Firebase.initializeApp();
    data = await FirebaseFirestore.instance.collection('Feedbacks').get();
    setState(() {
      data = data.docs;
      flag = true;
    });
  }

  Rating(rating) {
    List options = const ['Terrible', 'Bad', 'Okay', 'Good', 'Great'];
    switch (rating) {
      case 1:
        return Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("./assets/1_emoji.png"),
              backgroundColor: Colors.transparent,
              radius: 24,
            ),
            SizedBox(
              height: 5,
            ),
            Text(options[0]),
          ],
        );
      case 2:
        return Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("./assets/2_emoji.png"),
              backgroundColor: Colors.transparent,
              radius: 24,
            ),
            SizedBox(
              height: 5,
            ),
            Text(options[1]),
          ],
        );
      case 3:
        return Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("./assets/3_emoji.png"),
              backgroundColor: Colors.transparent,
              radius: 24,
            ),
            SizedBox(
              height: 5,
            ),
            Text(options[2]),
          ],
        );
      case 4:
        return Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("./assets/4_emoji.png"),
              backgroundColor: Colors.transparent,
              radius: 24,
            ),
            SizedBox(
              height: 5,
            ),
            Text(options[3]),
          ],
        );
      case 5:
        return Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("./assets/5_emoji.png"),
              backgroundColor: Colors.transparent,
              radius: 24,
            ),
            SizedBox(
              height: 5,
            ),
            Text(options[4]),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(181, 2, 1, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "FeedBacks",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
            children: flag
                ? data
                    .map<Widget>(
                      (e) => Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "NickName",
                                    ),
                                    Text(
                                      e['name'],
                                    ),
                                    Text(
                                      "Email",
                                    ),
                                    Text(
                                      e["email"],
                                    ),
                                    Text(
                                      "Phone Number",
                                    ),
                                    Text(
                                      e["number"].toString(),
                                    ),
                                  ],
                                ),
                                Rating(e["rating"]),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromRGBO(209, 54, 51, 1),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                    .toList()
                : []),
      ),
    );
  }
}
