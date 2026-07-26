import 'package:flutter/material.dart';

void main() {
  runApp(const QuranifyApp());
}

class QuranifyApp extends StatelessWidget {
  const QuranifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quranify',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFF1DB954),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1DB954),
          surface: Color(0xFF181818),
        ),
        fontFamily: 'sans-serif',
      ),
      home: const QuranifyHome(),
    );
  }
}

class QuranifyHome extends StatefulWidget {
  const QuranifyHome({super.key});

  @override
  State<QuranifyHome> createState() => _QuranifyHomeState();
}

class _QuranifyHomeState extends State<QuranifyHome> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ExploreScreen(),
    const LibraryScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: const Color(0xFF181818),
        selectedItemColor: const Color(0xFF1DB954),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Quranify Premium',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Icon(Icons.verified, color: Color(0xFF1DB954), size: 20),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'For Study, Work & Sleep • 100% Free & Ad-Free',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 20),
            const Text(
              'Modes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(child: ModeCard(title: 'Study', icon: Icons.menu_book, color: Colors.green)),
                SizedBox(width: 10),
                Expanded(child: ModeCard(title: 'Work Flow', icon: Icons.work, color: Colors.blue)),
                SizedBox(width: 10),
                Expanded(child: ModeCard(title: 'Deep Sleep', icon: Icons.nightlight, color: Colors.purple)),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              'Recommended Playlists',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF181818),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.headphones, color: Color(0xFF1DB954)),
                    ),
                    title: Text('Surah Session ${index + 1}', style: const TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: const Text('Mishary Rashid Alafasy • Loop Mode', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    trailing: const Icon(Icons.play_circle_fill, color: Color(0xFF1DB954), size: 32),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ModeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const ModeCard({super.key, required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF181818),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }
}

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Your Saved Surahs & Downloads', style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), backgroundColor: const Color(0xFF181818)),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Version'),
            subtitle: Text('1.0.0 Free Edition'),
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: Text('Dedicated for the sake of Allah'),
            subtitle: Text('No ads, no tracking, completely open.'),
          ),
        ],
      ),
    );
  }
}
