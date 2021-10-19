import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(181, 2, 1, 1),
      appBar: AppBar(
        title: const Text(
          'SELECTED PICTURE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  color: Colors.white,
                  height: 580,
                  width: 380,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
          // icon: Image.asset( "./assets/imgtext.png",
          // fit: BoxFit.contain,
          // height: 40,
          // width: 40,),
          icon: Icon(Icons.image),
          backgroundColor: Color.fromRGBO(209, 54, 51, 1),
          label: Text('Convert'),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/converted');
          }),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        color: Colors.black,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                tooltip: 'New Image',
                icon: const Icon(Icons.camera_alt, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Save as Text',
                icon: const Icon(Icons.save, color: Colors.white),
                onPressed: () {},
              ),
              SizedBox(
                width: 50,
              ),
              IconButton(
                tooltip: 'Copy to Clipboard',
                icon: const Icon(Icons.copy, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Translate',
                icon: const Icon(Icons.translate, color: Colors.white),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
