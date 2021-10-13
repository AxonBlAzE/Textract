import 'package:flutter/material.dart';
import 'package:textract/pages/choice.dart';
import 'package:textract/pages/home.dart';
import 'package:textract/pages/image.dart';
import 'package:textract/pages/loading.dart';
import 'package:textract/pages/show.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/choice':(context) => Choice(),
    '/image':(context) => Selected_Image(),
    '/text':(context) => Show_Text(),
  },
));


