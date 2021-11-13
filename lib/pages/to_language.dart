import 'package:flutter/material.dart';
import 'package:textract/services/translate.dart';

class ToLanguage extends StatefulWidget {
  const ToLanguage({ Key? key }) : super(key: key);

  @override
  _ToLanguageState createState() => _ToLanguageState();
}

class _ToLanguageState extends State<ToLanguage> {

  List<Translate> languages = [
    Translate(to: 'en', language: 'English', flag: 'flags/uk.png'),
    Translate(to: 'hi', language: 'Hindi', flag: 'flags/india.png'), 
    Translate(to: 'de', language: 'German', flag: 'flags/germany.png'), 
    Translate(to: 'el', language: 'Greek', flag: 'flags/greece.png'), 
    Translate(to: 'ko', language: 'Korean', flag: 'flags/south_korea.png'),  
    Translate(to: 'sw', language: 'Swahili', flag: 'flags/kenya.png'),
    Translate(to: 'id', language: 'Indonesian', flag: 'flags/indonesia.png'),  
  ];

  @override
  Widget build(BuildContext context) {
    Map data = {};

    if (data.isNotEmpty) {
      data = data;
    } else {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    }

    String text = data['text'];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(181, 2, 1, 1),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text('Pick a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    // print(languages[index].language);
                    Navigator.pushNamed(context, '/translating', arguments: {
                      'text': text,
                      'language': languages[index].language,
                      'to':languages[index].to,
                    });
                  },
                  title: Text(languages[index].language),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${languages[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}