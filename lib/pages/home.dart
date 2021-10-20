import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  // var data = new Map();
  Map<String, String> data = {
    "Summary": "Have you ever needed to extract text from a picture but couldn't and ended up having to type it in by hand?\n\nIf that's the case, Textract is the tool you've been looking for.\n\nTextract will make extracting text from any image a breeze with just one click.",
    "Step-1": "Simply choose an image from the gallery or take a new one.",
    "Step-2": "By pressing the convert button, you may now transform the image to text.",
    "Step-3": "You can also use Translate button to switch from english to another language."
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(181, 2, 1, 1),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "TEXTRACT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('./assets/logo.png'),
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(209, 54, 51, 1),
                    borderRadius: BorderRadius.circular(31),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const Text(
                          "Welcome to Textract.\n",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          data['Summary'].toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
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
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("./assets/camera.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(209, 54, 51, 1),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Step 1",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(209, 54, 51, 1),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              data['Step-1'].toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(209, 54, 51, 1),
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
                      padding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
                      child: Image.asset("./assets/convert.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(209, 54, 51, 1),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Step 2",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(209, 54, 51, 1),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              // "",
                              data['Step-2'].toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(209, 54, 51, 1),
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
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset(
                        "./assets/change.png",
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(209, 54, 51, 1),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Step 3",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(209, 54, 51, 1),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              // "",
                              data['Step-3'].toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/choice');
                    },
                    child: Text("Get Started ->"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
