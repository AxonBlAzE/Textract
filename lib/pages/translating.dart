import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:translator/translator.dart';

class Translating extends StatefulWidget {
  const Translating({ Key? key }) : super(key: key);

  @override
  _TranslatingState createState() => _TranslatingState();
}

class _TranslatingState extends State<Translating> {
  @override
  Widget build(BuildContext context) {

    Map data = {};

    if (data.isNotEmpty) {
      data = data;
    } else {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    }

    String text = data['text'];
    String to = data['to'];
    String language = data['language'];

    getTranslation(String text,String to) async {
      final translator = GoogleTranslator();
      String from = 'en';
      var translated = await translator.translate(text, from: from, to: to);
      // print('tranlate :$translated');
      String txt = translated.toString();
      return txt;
    }

    gotoTranslated() async {
      String translated = await getTranslation(text, to);
      // print('tranlate :$translated');
      await Future.delayed(const Duration(seconds: 2), () async {
        Navigator.popAndPushNamed(context, '/translated', arguments: {
          'text': text,
          'translated' : translated,
          'to': to,
          'language': language,
        });
      });
    }
    
    setState(() {
      gotoTranslated();
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
            const SizedBox(height: 20,),
            Text(
              'Translating to $language',
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
