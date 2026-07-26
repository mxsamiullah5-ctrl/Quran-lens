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
          surface: Color(0xFF1E1E1E),
        ),
      ),
      home: const QuranifyDashboard(),
    );
  }
}

class QuranifyDashboard extends StatefulWidget {
  const QuranifyDashboard({super.key});

  @override
  State<QuranifyDashboard> createState() => _QuranifyDashboardState();
}

class _QuranifyDashboardState extends State<QuranifyDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ExploreTab(),
    LibraryTab(),
    SettingsTab(),
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
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

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
                  'Quranify',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5),
                ),
                Icon(Icons.verified_rounded, color: Color(0xFF1DB954), size: 22),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'For Study, Work & Sleep • 100% Free & Ad-Free',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 24),
            const Text(
              'Focus Modes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: ModeTile(
                    title: 'Study',
                    subtitle: 'Memory & Focus',
                    icon: Icons.menu_book_rounded,
                    accentColor: Color(0xFF2E7D32),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ModeTile(
                    title: 'Work Flow',
                    subtitle: 'Deep Ambient',
                    icon: Icons.work_outline_rounded,
                    accentColor: Color(0xFF1565C0),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ModeTile(
                    title: 'Sleep',
                    subtitle: 'Rest & Calm',
                    icon: Icons.nightlight_round,
                    accentColor: Color(0xFF6A1B9A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Featured Surahs & Playlists',
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
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1DB954).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.play_arrow_rounded, color: Color(0xFF1DB954), size: 28),
                    ),
                    title: Text('Surah Al-Baqarah (${index + 1})', style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: const Text('Mishary Rashid Alafasy • Loop Mode', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    trailing: const Icon(Icons.favorite_border, color: Colors.grey, size: 20),
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

class ModeTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;

  const ModeTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: accentColor, size: 26),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 2),
          Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        ],
      ),
    );
  }
}

class LibraryTab extends StatelessWidget {
  const LibraryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Your Saved Playlists & Downloads\n(Ad-free & Offline Ready)',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF181818),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('App Version'),
            subtitle: Text('1.0.0 Premium Free Edition'),
          ),
          Divider(color: Colors.white10),
          ListTile(
            leading: Icon(Icons.volunteer_activism, color: Color(0xFF1DB954)),
            title: Text('For the sake of Allah'),
            subtitle: Text('Built completely free with zero ads or tracking.'),
          ),
        ],
      ),
    );
  }
}
