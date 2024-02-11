import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/home.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                "assets/images/icon.png",
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20,),
            const Text(
                "MyNote",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const Text('...Simplifying your workflows'),
          ],
        ),
      ),
    );
  }
}
