//firebase Integration for Jouranlling Entry



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class CalmoraJournalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calmora Journal',
      theme: ThemeData.dark(),
      home: JournalPage(),
    );
  }
}

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _addJournalEntry() {
    final String title = _titleController.text;
    final String content = _contentController.text;
    final Timestamp date = Timestamp.now(); // Use Timestamp for Firestore

    if (title.isNotEmpty && content.isNotEmpty) {
      FirebaseFirestore.instance.collection('journals').add({
        'title': title,
        'content': content,
        'date': date,
      });
      _titleController.clear();
      _contentController.clear();
    }
  }

  void _deleteJournalEntry(String docId) {
    FirebaseFirestore.instance.collection('journals').doc(docId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Entry deleted successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Journal Entries')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Write your thoughts...'),
              maxLines: 3,
            ),
          ),
          ElevatedButton(
            onPressed: _addJournalEntry,
            child: Text('Add Journal Entry'),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('journals')
                  .orderBy('date', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot entry = snapshot.data!.docs[index];

                    return Dismissible(
                      key: Key(entry.id), // Unique key for each item
                      direction: DismissDirection.endToStart, // Swipe to the left
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        _deleteJournalEntry(entry.id);
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        color: Colors.deepPurple,
                        child: ListTile(
                          title: Text(entry['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(entry['content'], style: TextStyle(color: Colors.white70)),
                              SizedBox(height: 5),
                              Text(
                                entry['date'] != null
                                    ? (entry['date'] is Timestamp
                                        ? (entry['date'] as Timestamp).toDate().toString()
                                        : entry['date'].toString())
                                    : 'No Date',
                                style: TextStyle(fontSize: 12, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
