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
  List options = const ['Terrible', 'Bad', 'Okay', 'Good', 'Great'];
  var data;
  int minlimit = 4;
  ScrollController scroll = ScrollController();

  @override
  // if (data.isNotEmpty) {
  //     data = data;
  //   } else {
  //     data = ModalRoute.of(context)?.settings.arguments as Map;
  //   }

  void initState() {
    super.initState();
    Feed();
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        Dil_mange_more();
      }
    });
  }

  Dil_mange_more() {
    setState(() {
      minlimit += 3;
    });
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
    // print(data.length);
    setState(() {
      data = data.docs;
      flag = true;
    });
    // print(data.length);
    // print(data);
  }

  emoji_creator(path, textOption) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(path),
            backgroundColor: Colors.transparent,
            radius: 24,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            options[textOption],
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }

  Rating(rating) {
    switch (rating) {
      case 1:
        return emoji_creator("./assets/1_emoji.png", 0);
      case 2:
        return emoji_creator("./assets/2_emoji.png", 1);
      case 3:
        return emoji_creator("./assets/3_emoji.png", 2);
      case 4:
        return emoji_creator("./assets/4_emoji.png", 3);
      case 5:
        return emoji_creator("./assets/5_emoji.png", 4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "User Feedbacks",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
          child: flag
              ? ListView.builder(
                  controller: scroll,
                  itemCount:
                      minlimit < data.length ? minlimit + 1 : data.length,
                  itemBuilder: (context, i) {
                    if (i == minlimit) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.red,
                      ));
                    }
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          // alignment: Alignment.center,
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.red),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13),
                                        child: Text(
                                          data[i]["name"],
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Rating(data[i]["rating"]),
                                    // emoji_creator("./assets/5_emoji.png", 4),
                                  ],
                                ),
                                data[i]["details"] != ''
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 15),
                                        child: Text(
                                          data[i]["details"],
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 2,
                                      )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  })
              : SizedBox()),
    );
  }
}