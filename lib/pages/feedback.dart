import 'package:flutter/material.dart';

class FeedbackOption extends StatelessWidget {
  const FeedbackOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Select an option",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/feedbackform');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(209, 54, 51, 1),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(
                    const Size.fromWidth(350),
                  ),
                ),
                child: const Text(
                  "Give Feedback",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/viewfeed');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(209, 54, 51, 1),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(
                    const Size.fromWidth(350),
                  ),
                ),
                child: const Text(
                  "View Reviews",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
