import 'package:flutter/material.dart';
import 'mood_database.dart';

class MoodHistoryPage extends StatefulWidget {
  const MoodHistoryPage({super.key});

  @override
  _MoodHistoryPageState createState() => _MoodHistoryPageState();
}

class _MoodHistoryPageState extends State<MoodHistoryPage> {
  late Future<List<Map<String, dynamic>>> _moodHistory;
  int? _selectedIndex; // Tracks which card is touched

  @override
  void initState() {
    super.initState();
    _loadMoodHistory();
  }

  void _loadMoodHistory() {
    setState(() {
      _moodHistory = DatabaseHelper().getMoods();
    });
  }

  void _deleteMood(int id) async {
    await DatabaseHelper().deleteMood(id);
    _loadMoodHistory();
  }

  void _confirmDelete(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Mood Entry"),
        content: const Text("Are you sure you want to delete this mood entry?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _deleteMood(id);
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Mood History')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _moodHistory,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var moods = snapshot.data!;
          if (moods.isEmpty) {
            return const Center(child: Text("No mood entries yet!"));
          }
          return ListView.builder(
            itemCount: moods.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index; 
                  });
                },
                onLongPress: () {
                  _confirmDelete(moods[index]['id']); 
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 3,
                  child: ListTile(
                    title: Text(moods[index]['mood'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(moods[index]['description']),
                        Text(
                          "Date: ${moods[index]['date']}",
                          style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: _selectedIndex == index
                        ? IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _confirmDelete(moods[index]['id']),
                          )
                        : null,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
