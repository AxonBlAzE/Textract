import 'package:flutter/material.dart';
import 'package:textract/pages/choice.dart';
import 'package:textract/pages/home.dart';
import 'package:textract/pages/image.dart';
import 'package:textract/pages/loading.dart';
import 'package:textract/pages/show.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => const Loading(),
    '/home':(context) => const Home(),
    '/choice':(context) => const Choice(),
    '/image':(context) => const Selected_Image(),
    '/text':(context) => const Show_Text(),
  },
));


