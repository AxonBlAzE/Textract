import 'package:flutter/material.dart';
import 'package:textract/pages/choice.dart';
import 'package:textract/pages/extracting.dart';
import 'package:textract/pages/feedback.dart';
import 'package:textract/pages/submitting.dart';
import 'package:textract/pages/viewfeedback.dart';
import 'package:textract/pages/home.dart';
import 'package:textract/pages/preview.dart';
import 'package:textract/pages/loading.dart';
import 'package:textract/pages/converted.dart';
import 'package:textract/pages/feedbackform.dart';
import 'package:textract/pages/to_language.dart';
import 'package:textract/pages/translated.dart';
import 'package:textract/pages/translating.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => Home(),
          '/choice': (context) => Choice(),
          '/preview': (context) => Preview(),
          '/extracting': (context) => Extracting(),
          '/converted': (context) => Converted(),
          '/choose-language': (context) => ToLanguage(),
          '/translating': (context) => Translating(),
          '/translated': (context) => Translated(),
          '/feedback': (context) => FeedbackOption(),
          '/feedbackform': (context) => FeedbackForm(),
          // '/viewfeed': (context) => Viewfeedback(),
          '/submitting': (context) => Submitting(),
        },
      ),
    );
