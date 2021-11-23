import 'package:flutter/material.dart';

class ErrorNetwork extends StatelessWidget {
  const ErrorNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("./assets/error_int.png"),
                radius: 120,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "NO INTERNET CONNECTION",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "You are not connected to the internet. Please connect to the internet and try again",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Check your internet connection. If you see this error even if your internet connection is working please mail us on textract-help@textract.com",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: Text("Go back"),
              // ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10.0),
                  primary: Colors.black,
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Go Back"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
