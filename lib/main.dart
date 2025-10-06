import 'package:flutter/material.dart';

void main() {
  runApp(const DriveOnPH());
}

class DriveOnPH extends StatelessWidget {
  const DriveOnPH({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/DriveOnPHLogo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 30),
            Text(
              'Your Journey To Safe Driving',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 16,
                color: Colors.black),
                ),
              ),
            ],  
          ),
        ),
      );
    }
}