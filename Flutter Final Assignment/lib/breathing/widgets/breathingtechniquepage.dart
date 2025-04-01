import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BreathingTechniquesPage extends StatelessWidget {
  final List<Map<String, String>> techniques = [
    {
      'title': 'Anxiety Breathing',
      'description': 'Calm anxiety with controlled breathing.',
      'details': 'Inhale for 4 seconds, hold for 4 seconds, and exhale for 4 seconds.',
      'animation': 'assets/animations/box_breathing.json'
    },
    {
      'title': 'Breathing for Sleep',
      'description': 'Helps you relax before sleep.',
      'details': 'Inhale for 4 seconds, hold for 7 seconds, and exhale for 8 seconds.',
      'animation': 'assets/animations/sloth_breathing.json'
    },
    {
      'title': 'Breath for Energy',
      'description': 'Boost your energy levels.',
      'details': 'Inhale deeply through the nose and exhale quickly through the mouth.',
      'animation': 'assets/animations/girl_breathing.json'
    },
  ];

  void showBreathingDetails(BuildContext context, Map<String, String> technique) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(technique['title']!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(technique['animation']!),
              SizedBox(height: 10),
              Text(technique['details']!),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Breathing Techniques')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: techniques.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(techniques[index]['title']!),
                subtitle: Text(techniques[index]['description']!),
                onTap: () => showBreathingDetails(context, techniques[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
