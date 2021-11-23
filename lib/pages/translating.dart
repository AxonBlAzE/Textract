import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:textract/pages/error_network.dart';
import 'package:textract/pages/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:translator/translator.dart';

class Translating extends StatefulWidget {
  const Translating({Key? key}) : super(key: key);

  @override
  _TranslatingState createState() => _TranslatingState();
}

class _TranslatingState extends State<Translating> {
  late ConnectivityResult result;
  bool internet = false;
  int first = -1;
  late StreamSubscription<ConnectivityResult> syncer;

  Future<void> connection1() async {
    bool previous = internet;
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        first++;
        internet = true;
      } else {
        internet = false;
      }
    } on SocketException catch (_) {
      internet = false;
    }
    if (previous != internet) {
      setState(() {
        internet = internet;
      });
    }
  }

  Future<void> connection2() {
    return connection1();
  }

  Future<void> connection() async {
    first++;
    // ignore: non_constant_identifier_names
    var Result = await (Connectivity().checkConnectivity());
    if (Result == ConnectivityResult.mobile) {
      return connection2();
    } else if (Result == ConnectivityResult.wifi) {
      return connection2();
    } else {
      setState(() {
        internet = false;
      });
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> _connection_change(ConnectivityResult result) async {
    setState(() {
      connection();
      internet = internet;
    });
  }

  @override
  initState() {
    super.initState();
    connection();
    syncer = Connectivity().onConnectivityChanged.listen(_connection_change);
  }

  @override
  dispose() {
    super.dispose();
    syncer.cancel();
  }

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

    getTranslation(String text, String to) async {
      final translator = GoogleTranslator();
      var translated;
      String from = 'en';
      try {
        translated = await translator.translate(text, from: from, to: to);
        // print('tranlate :$translated');
        String txt = translated.toString();
        return txt;
      } on Exception {
        connection();
      }
      return translated;
    }

    gotoTranslated() async {
      String translated = await getTranslation(text, to);
      // print('tranlate :$translated');
      // ignore: unnecessary_null_comparison
      if (translated != null) {
        await Future.delayed(const Duration(seconds: 2), () async {
          Navigator.popAndPushNamed(context, '/translated', arguments: {
            'text': text,
            'translated': translated,
            'to': to,
            'language': language,
          });
        });
      } else {
        connection();
        internet ? const Error() : const SizedBox();
      }
    }

    setState(() {
      internet ? gotoTranslated() : const SizedBox();
    });

    return internet
        ? Scaffold(
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
                  const SizedBox(
                    height: 20,
                  ),
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
          )
        : first >= 2
            ? const SizedBox()
            : const ErrorNetwork();
  }
}
