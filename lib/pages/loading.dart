import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void gotoHome() async {
    await Future(() => const Duration(seconds: 2));
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
          duration: Duration(milliseconds: 1200),
        )
      ),
    );
  }
}