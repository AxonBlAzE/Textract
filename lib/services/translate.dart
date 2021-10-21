import 'package:translator/translator.dart';

class Translate{
  
  late String language;
  late String to;
  late String flag;

  Translate({required this.language,required this.to,required this.flag});

  Future <String> getTranslated(String text,String to) async {
    final translator = GoogleTranslator();
    String from = 'en';
    var translated = translator.translate(text, from: from, to: to);
    String txt = translated.toString();
    return txt;
  }
}