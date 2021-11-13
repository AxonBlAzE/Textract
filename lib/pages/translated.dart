import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';


class Translated extends StatefulWidget {
  const Translated({ Key? key }) : super(key: key);

  @override
  _TranslatedState createState() => _TranslatedState();
}

class _TranslatedState extends State<Translated> {

  void showCopied(){
      Fluttertoast.showToast(
        msg: 'Copied to Clipboard.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
    }
    static Future<void> saveToFile(String filename, String text) async {
    print("in function saveToFile");
    Directory directory;
    try{
      directory = await DownloadsPathProvider.downloadsDirectory;
      final path = '${directory.path}/$filename';
      final file = File(path);
      print("Saving $path");
      await file.writeAsString(text);
    }on PlatformException {
      print('Could not get the downloads directory');
    }
    
  }

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
    String to = data['to'];
    language = data['language'].toUpperCase();

    return Scaffold(
      backgroundColor: Color.fromRGBO(181, 2, 1, 1),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              height: 600,
              width: 380,
              child: Text(translated),
            ),
          )
          ],
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.translate),
        backgroundColor: Color.fromRGBO(209, 54, 51, 1),
        label: Text('Translate'),
        onPressed: () {Navigator.pushNamed(context, '/choose-language', arguments: {
          'text': text,
        });},
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
              icon: const Icon(Icons.camera_alt,color: Colors.white),
              onPressed: () {Navigator.popAndPushNamed(context, '/choice');},
            ),
            IconButton(
              tooltip: 'Save as Text',
              icon: const Icon(Icons.save,color: Colors.white),
              onPressed: () {
                String saveAsText = translated;
                    print("SaveASTEXT: $saveAsText");

                    DateTime now = DateTime.now();
                    String fileName = "Textract_"+DateFormat('dd-MMM-yyyy – kk:mm:ss').format(now);

                    saveToFile(fileName+".txt", saveAsText);
              },
            ),
            SizedBox(width: 70,),
            IconButton(
              tooltip: 'Copy to Clipboard',
              icon: const Icon(Icons.copy,color: Colors.white),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: text));
                showCopied();
              },
            ),
            IconButton(
              tooltip: 'Give Feedback',
              icon: const Icon(Icons.rate_review,color: Colors.white),
              onPressed: () {Navigator.popAndPushNamed(context, '/feedbackform');},
            )
          ],
        ),
      ),
    )
    );
  }
}