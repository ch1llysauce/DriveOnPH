import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:drive_on_ph/screens/main/register.dart';
import 'package:drive_on_ph/screens/dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255)
        ),
        child: ListView(
          children: [
            Padding(
              //Image
              padding: EdgeInsets.only(top: 10),
              child: Image.asset(
                'lib/assets/login.png',
                width: 250,
                height: 250,
              ),
            ),
            Padding(
              //Slogan
              padding: EdgeInsets.only(bottom: 0),
              child: Text(
                'Drive Smart. Drive Safe',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
            ),

            SizedBox(height: 30), //Log In Text
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Log In',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            SizedBox(height: 5), //Please sign in text
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Please sign in to continue',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),

            SizedBox(height: 20), //Username TextField
            UsernameField(),

            SizedBox(height: 5), //Password TextField
            PasswordField(),

            SizedBox(height: 50), //Login Button
            LoginButton(),

            SizedBox(height: 20), // Connect with Google
            SignInGoogle(),

            SizedBox(height: 20),
            Padding(
              // Sign Up
              padding: const EdgeInsets.only(bottom: 0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Don't have an account? ", // normal text
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                  children: [
                    TextSpan(
                      text: 'Sign Up', // clickable part
                      style: const TextStyle(
                        color: Color.fromARGB(255, 105, 93, 58),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UsernameField extends StatefulWidget {
  const UsernameField({super.key});

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Center(
        child: SizedBox(
          width: 320,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(132, 0, 0, 0).withValues(),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'lib/assets/username.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: SizedBox(
          width: 320, // match Username field width
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(132, 0, 0, 0).withValues(),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'lib/assets/lock.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      _obscureText
                          ? 'lib/assets/icon_eye_close.png'
                          : 'lib/assets/icon_eye_open.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: SizedBox(
          width: 320,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // Navigate to Splash screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              shadowColor: const Color.fromARGB(255, 0, 0, 0).withValues(),
            ),
            child: const Text(
              'LOG IN',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class SignInGoogle extends StatelessWidget {
  const SignInGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: SizedBox(
          width: 320,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              shadowColor: const Color.fromARGB(132, 0, 0, 0).withValues(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon on the left
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'lib/assets/googleicon.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                Expanded(
                  child: Text(
                    'CONTINUE WITH GOOGLE',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
