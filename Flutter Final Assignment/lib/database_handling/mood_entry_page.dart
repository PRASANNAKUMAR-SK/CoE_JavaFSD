import 'package:flutter/material.dart';
import 'mood_database.dart';

class MoodEntryPage extends StatefulWidget {
  @override
  _MoodEntryPageState createState() => _MoodEntryPageState();
}

class _MoodEntryPageState extends State<MoodEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _moodController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _moodController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _saveMood() async {
    if (_formKey.currentState!.validate()) {
      await DatabaseHelper().insertMood({
        'mood': _moodController.text,
        'description': _descriptionController.text,
        'date': _dateController.text,
      });

      // Show success message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Success"),
          content: Text("Mood saved successfully!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Return to previous page
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
      
      _moodController.clear();
      _descriptionController.clear();
      _dateController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Your Mood')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _moodController,
                decoration: InputDecoration(labelText: 'Mood'),
                validator: (value) => value!.isEmpty ? 'Enter your mood' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) => value!.isEmpty ? 'Enter description' : null,
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date (yyyy-mm-dd)'),
                validator: (value) => value!.isEmpty ? 'Enter date' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveMood,
                child: Text('Log Mood'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
