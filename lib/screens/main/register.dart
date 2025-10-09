import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:drive_on_ph/screens/main/login.dart';
import 'package:drive_on_ph/screens/main/register2.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Register());
  }
}

class Register extends StatelessWidget {
  const Register({super.key});

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
            const SizedBox(height: 20),
            const AddProfilePicture(),

            // Firstname, Lastname, M.I
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: buildTextField('Firstname'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: buildTextField('Lastname'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: buildTextField('M.I'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Birthdate and Age
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Birthdate',
                      hintText: 'MM-DD-YYYY',
                      suffixIcon: const Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: buildTextField('Age'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Gender
            const Text('Gender', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildGenderOption('Male'),
                buildGenderOption('Female'),
                buildGenderOption('Other'),
              ],
            ),

            const SizedBox(height: 20),

            // Contact Number
            buildTextField('Contact Number'),

            const SizedBox(height: 30),

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
                  MaterialPageRoute(builder: (context) => const Register2()),
                );
              },
              child: const Text(
                'NEXT',
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
                                builder: (context) => const LoginScreen()),
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
class AddProfilePicture extends StatelessWidget {
  const AddProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black26, width: 1),
                  ),
                  child: const CircleAvatar(
                    radius: 53,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.add, size: 40, color: Colors.black45),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Add Profile Picture',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
