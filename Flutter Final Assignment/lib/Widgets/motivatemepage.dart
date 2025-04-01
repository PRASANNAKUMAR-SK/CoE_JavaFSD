import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MotivateMePage extends StatefulWidget {
  @override
  _MotivateMePageState createState() => _MotivateMePageState();
}

class _MotivateMePageState extends State<MotivateMePage> {
  String _quote = "Click to Get";
  String _author = "-";

  Future<void> fetchQuote() async {
    final url = Uri.parse("https://favqs.com/api/qotd");

    try {
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _quote = data['quote']['body'];
          _author = "- " + data['quote']['author'];
        });
      } else {
        setState(() {
          _quote = "Failed to load quote. Status code: ${response.statusCode}";
          _author = "";
        });
      }
    } catch (e) {
      setState(() {
        _quote = "Error fetching quote: $e";
        _author = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quotes to help U")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '"$_quote"',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 10),
              Text(
                _author,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: fetchQuote,
                child: Text("Get Quotes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
