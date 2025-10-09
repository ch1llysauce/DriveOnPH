import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:drive_on_ph/screens/main/login.dart';
import 'package:drive_on_ph/screens/main/register.dart';
import 'package:drive_on_ph/screens/main/register3.dart';

class Register2Screen extends StatelessWidget {
  const Register2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Register2());
  }
}

class Register2 extends StatelessWidget {
  const Register2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            const SizedBox(height: 30),
            const Text(
              'Register',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 5),
            const AccImage(),

            // Username, Email Address, Password, Confirm Password
            Row(
              children: [Expanded(flex: 3, child: buildTextField('Username'))],
            ),

            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(flex: 3, child: buildTextField('Email Address')),
              ],
            ),

            const SizedBox(height: 30),
            Row(
              children: [Expanded(flex: 3, child: buildTextField('Password'))],
            ),

            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(flex: 3, child: buildTextField('Confirm Password')),
              ],
            ),

            const SizedBox(height: 20),
            // Next Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[300],
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register3()),
                );
              },
              child: const Text(
                'NEXT',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),
            // Next Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 165, 165, 165),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              child: const Text(
                'BACK',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 10),

            // Sign in Text
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(color: Colors.black87),
                  children: [
                    TextSpan(
                      text: 'Sign in',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Reusable TextField builder
  static Widget buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  // Reusable Gender Option
  static Widget buildGenderOption(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(value: text, groupValue: null, onChanged: (_) {}),
        Text(text),
      ],
    );
  }
}

//  Add Profile Picture widget
class AccImage extends StatelessWidget {
  const AccImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                //Image
                padding: EdgeInsets.only(top: 5),
                child: Image.asset(
                  'lib/assets/account-info-image.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),       
        ],
      ),
    );
  }
}
