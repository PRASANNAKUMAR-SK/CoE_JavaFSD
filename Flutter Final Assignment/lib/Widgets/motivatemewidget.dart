import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MotivateMeWidget extends StatefulWidget {
  @override
  _MotivateMeWidgetState createState() => _MotivateMeWidgetState();
}

class _MotivateMeWidgetState extends State<MotivateMeWidget> {
  String _quote = "Loading inspiration...";
  String _author = "";
  Timer? _timer; // Timer variable

  @override
  void initState() {
    super.initState();
    fetchQuote();
    
    // Automatically fetch a new quote every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 15), (Timer t) => fetchQuote());
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  Future<void> fetchQuote() async {
    final url = Uri.parse("https://favqs.com/api/qotd");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _quote = '"${data['quote']['body']}"';
          _author = "- ${data['quote']['author']}";
        });
      } else {
        setState(() {
          _quote = "Failed to load quote.";
          _author = "";
        });
      }
    } catch (e) {
      setState(() {
        _quote = "Error fetching quote.";
        _author = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _quote,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            Text(
              _author,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
