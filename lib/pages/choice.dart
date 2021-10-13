import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  const Choice({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[700],
      appBar: AppBar(
        // backgroundColor: Colors.red[700],
      ),
      body: Column(children: [
        const Text('Take A Picture From'),
        IconButton(
          icon: const Icon(Icons.camera),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.image),
          onPressed: () {},
        ),
      ],)
    );
  }
}