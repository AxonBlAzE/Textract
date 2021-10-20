import 'package:flutter/material.dart';
import 'package:textract/pages/choice.dart';
import 'package:textract/pages/home.dart';
import 'package:textract/pages/preview.dart';
import 'package:textract/pages/loading.dart';
import 'package:textract/pages/converted.dart';
import 'package:textract/pages/feedbackform.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => Home(),
          '/choice': (context) => Choice(),
          '/preview': (context) => Preview(),
          '/converted': (context) => Converted(),
          '/feedbackform': (context) => FeedbackForm(),
        },
      ),
    );
