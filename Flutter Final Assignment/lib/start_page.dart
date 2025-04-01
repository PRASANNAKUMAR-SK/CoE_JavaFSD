import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'homepage.dart';

class StartPage extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  const StartPage({super.key, required this.onLocaleChange});

  void _changeLanguageAndNavigate(BuildContext context, Locale locale) {
    onLocaleChange(locale); // Change the language
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to HomePage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Lottie.asset(
                'assets/animations/relax_startpage.json',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Select Language',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black45)],
                  ),
                ),
                const SizedBox(height: 20), // Space between the text and buttons
                ElevatedButton(
                  onPressed: () => _changeLanguageAndNavigate(context, const Locale('en')),
                  child: const Text('English'),
                ),
                ElevatedButton(
                  onPressed: () => _changeLanguageAndNavigate(context, const Locale('ta')),
                  child: const Text('தமிழ்'),
                ),
                ElevatedButton(
                  onPressed: () => _changeLanguageAndNavigate(context, const Locale('hi')),
                  child: const Text('हिन्दी'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


