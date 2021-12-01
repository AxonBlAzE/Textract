import 'package:flutter/material.dart';
import 'package:textract/pages/choice.dart';
import 'package:textract/pages/error_network.dart';
import 'package:textract/pages/error_page.dart';
import 'package:textract/pages/extracting.dart';
import 'package:textract/pages/feedback.dart';
import 'package:textract/pages/fetching_reviews.dart';
import 'package:textract/pages/submitting.dart';
// import 'package:textract/pages/viewfeedbacknew.dart';
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
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => Home(),
          '/choice': (context) => const Choice(),
          '/preview': (context) => const Preview(),
          '/extracting': (context) => const Extracting(),
          '/converted': (context) => const Converted(),
          '/choose-language': (context) => const ToLanguage(),
          '/translating': (context) => const Translating(),
          '/translated': (context) => const Translated(),
          '/feedback': (context) => const FeedbackOption(),
          '/feedbackform': (context) => const FeedbackForm(),
          '/viewfeed': (context) => const Viewfeedback(),
          '/submitting': (context) => const Submitting(),
          '/error': (context) => const Error(),
          '/errornetwork': (context) => const ErrorNetwork(),
          '/fetching': (context) => const Fetching(),
        },
      ),
    );
