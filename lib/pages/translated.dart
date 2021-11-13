import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:intl/intl.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Translated extends StatefulWidget {
  const Translated({Key? key}) : super(key: key);

  @override
  _TranslatedState createState() => _TranslatedState();
}

class _TranslatedState extends State<Translated> {
  void showCopied() {
    Fluttertoast.showToast(
      msg: 'Copied to Clipboard.',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  void showPermissionDenied() {
    Fluttertoast.showToast(
      msg: 'Storage Access Denied.Unable to Access Storage.',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  void showSaved(String name) {
    Fluttertoast.showToast(
      // msg: 'Saved as Text Document.',
      msg: 'Saved as $name.',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

 Future<void> saveToFile(String filename, String text) async {
    Directory directory;
    try {
      if (await _requestPermission(Permission.storage)) {
        directory = await DownloadsPathProvider.downloadsDirectory;
        final path = '${directory.path}/$filename';
        final file = File(path);
        await file.writeAsString(text);
        showSaved(filename);
      } else {
        showPermissionDenied();
      } 
    } on PlatformException {
      // print('Could not get the downloads directory');
    }
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

    String language = 'ENGLISH';
    String text = data['text'];
    String translated = data['translated'];
    // ignore: unused_local_variable
    String to = data['to'];
    language = data['language'].toUpperCase();

    return Scaffold(
        backgroundColor: const Color.fromRGBO(181, 2, 1, 1),
        appBar: AppBar(
          title: Text(
            'TRANSLATED TO $language',
            style: const TextStyle(
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
              child: Container(
                color: Colors.white,
                height: 600,
                width: 380,
                child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        translated,
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
              ),
            )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.translate),
          backgroundColor: const Color.fromRGBO(209, 54, 51, 1),
          label: const Text('Translate'),
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
                  onPressed: () {
                    String saveAsText = translated;
                    DateTime now = DateTime.now();
                    String fileName = "Textract_Files/Textract_" +
                        DateFormat('dd-MMM-yyyy – kk.mm.ss').format(now);

                    saveToFile(fileName + ".txt", saveAsText);
                  },
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
                    Navigator.popAndPushNamed(context, '/feedbackform');
                  },
                )
              ],
            ),
          ),
        ));
  }
}
