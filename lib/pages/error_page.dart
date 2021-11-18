import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.41,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "./assets/error_image.png",
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              const Text(
                "Oops! Something Went Wrong",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Try again after some time.",
                style: TextStyle(fontSize: 14),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: const Text(
                  "We have encountered an error. If this problem persists, Contact Us.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text("Close"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
