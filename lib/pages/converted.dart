import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Converted extends StatefulWidget {
  const Converted({Key? key}) : super(key: key);

  @override
  _ConvertedState createState() => _ConvertedState();
}

class _ConvertedState extends State<Converted> {
  void showCopied() {
    Fluttertoast.showToast(
      msg: 'Copied to Clipboard.',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  double fontSize = 14;

  @override
  Widget build(BuildContext context) {
    Map data = {};

    if (data.isNotEmpty) {
      data = data;
    } else {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    }

    String text = data['text'];

    

    return Scaffold(
        backgroundColor: Color.fromRGBO(181, 2, 1, 1),
        appBar: AppBar(
          title: const Text(
            'CONVERTED TEXT',
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('./assets/text_dec.png'),
                    height: 30,
                    width: 30,
                    ),
                  SizedBox(
                    width: 270,
                    child: Slider(
                            value: fontSize,
                            onChanged: (newSize) {
                              setState(() {
                                fontSize = newSize;
                              });
                            },
                            min: 10,
                            max: 20,
                            divisions: 5,
                            activeColor: Colors.white,
                            inactiveColor: Colors.white24,
                          ),
                  ),
                  const Image(
                    image: AssetImage('./assets/text_inc.png'),
                    height: 40,
                    width: 40,
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 595,
                      width: 380,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            text,
                            style: TextStyle(fontSize: fontSize),),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.translate),
          backgroundColor: Color.fromRGBO(209, 54, 51, 1),
          label: Text('Translate'),
          onPressed: () {
            Navigator.pushNamed(context, '/choose-language', arguments: {
              'text': text,
            });
          },
        ),
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
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/choice');
                  },
                ),
                IconButton(
                  tooltip: 'Save as Text',
                  icon: const Icon(Icons.save, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 70,
                ),
                IconButton(
                  tooltip: 'Copy to Clipboard',
                  icon: const Icon(Icons.copy, color: Colors.white),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: text));
                    showCopied();
                  },
                ),
                IconButton(
                  tooltip: 'Give Feedback',
                  icon: const Icon(Icons.rate_review, color: Colors.white),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/feedback');
                  },
                )
              ],
            ),
          ),
        ));
  }
}
