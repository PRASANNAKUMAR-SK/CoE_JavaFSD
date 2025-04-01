import 'package:flutter/material.dart';
import 'widgets/motivatemepage.dart';
import 'widgets/motivatemewidget.dart';
import 'breathing/widgets/breathing_widget.dart';
import 'breathing/widgets/breathingtechniquepage.dart';
import 'database_handling/mood_entry_page.dart';
import 'database_handling/mood_history_page.dart';
import 'calmorajournalapp.dart';
import 'localization/localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    BreathingTechniquesPage(),
    MotivateMePage(),
    MoodHistoryPage(),
    CalmoraJournalApp(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white60,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: AppLocalizations.of(context).translate('home')),
          BottomNavigationBarItem(icon: Icon(Icons.self_improvement), label: AppLocalizations.of(context).translate('breath')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: AppLocalizations.of(context).translate('motivate_me')),
          BottomNavigationBarItem(icon: Icon(Icons.nightlight_round), label: AppLocalizations.of(context).translate('mood')),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: AppLocalizations.of(context).translate('journal')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MoodEntryPage()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              AppLocalizations.of(context).translate('welcome'),
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              AppLocalizations.of(context).translate('peace_and_positivity'),
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            _buildQuoteCard(AppLocalizations.of(context).translate('quote1')),
            _buildQuoteCard(AppLocalizations.of(context).translate('quote2')),
            MotivateMeWidget(),
            const SizedBox(height: 10),
            _buildNavigationButton(context, AppLocalizations.of(context).translate('quotes'), MotivateMePage()),
            _buildNavigationButton(context, AppLocalizations.of(context).translate('breathing_exercises'), BreathingTechniquesPage()),
            _buildNavigationButton(context, AppLocalizations.of(context).translate('mood_list'), MoodHistoryPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildQuoteCard(String quote) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              quote,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Icon(Icons.format_quote, color: Colors.white70, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, String text, Widget page) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}



