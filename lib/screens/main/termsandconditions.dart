import 'package:flutter/material.dart';
import 'package:drive_on_ph/screens/main/splash.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TermsConditions(),
    );
  }
}

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditions();
}

class _TermsConditions extends State<TermsConditions> {
  final Map<String, bool> terms = {
    "Purpose of the App\nDriveOnPH is for learning about driving, road safety, and license application. It does not replace official driving schools or LTO exams.":
        false,
    "Safe Use\nDo not use the app while driving. We are not responsible for accidents, violations, or injuries.":
        false,
    "Your Info\nProvide correct details when signing up. Keep your account private.":
        false,
    "Learning Materials\nLessons and quizzes are for education. Always confirm official requirements with the LTO.":
        false,
    "Fair Use\nDon’t cheat, spam, or use the app for harmful or illegal activities.":
        false,
    "Updates\nWe may change or improve the app and these terms anytime.": false,
    "I have read and agree to the Terms & Conditions.": false,
  };

  bool get allChecked => terms.values.every((checked) => checked);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        children: [
          const Text(
            'Register',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Terms and Conditions',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 30),

          //  Terms List
          for (var entry in terms.entries)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: entry.value,
                    activeColor: Colors.blueAccent,
                    onChanged: (bool? value) {
                      setState(() {
                        terms[entry.key] = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Builder(
                      builder: (_) {
                        final parts = entry.key.split('\n');
                        final title = parts.first;
                        final description = parts.length > 1
                            ? parts.sublist(1).join('\n')
                            : '';

                        return RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              height: 1.3,
                            ),
                            children: [
                              TextSpan(
                                text: "$title\n",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: description),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 10),

          //  CREATE ACCOUNT Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: allChecked
                  ? Colors.blueAccent
                  : Colors.blueGrey.shade200,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: allChecked
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Account Created Successfully!'),
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Splash(),
                      ),
                    );
                  }
                : null,
            child: const Text(
              'CREATE ACCOUNT',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
