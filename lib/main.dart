import 'package:flutter/material.dart';
import 'package:textract/pages/choice.dart';
import 'package:textract/pages/home.dart';
import 'package:textract/pages/preview.dart';
import 'package:textract/pages/loading.dart';
import 'package:textract/pages/show.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => Home(),
          '/choice': (context) => Choice(),
          '/preview': (context) => Preview(),
          '/text': (context) => Show_Text(),
        },
      ),
    );
