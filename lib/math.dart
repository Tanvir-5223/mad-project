import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePage.dart';

class KiddoApp extends StatelessWidget {
  const KiddoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MathPage(),
    );
  }
}

class MathPage extends StatefulWidget {
  const MathPage({super.key});

  @override
  State<MathPage> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  int _selectedIndex = 3; // 👈 "Subjects" selected by default

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LearningVideosPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MathGamePage()),
      );
    } else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDEDED),
      appBar: AppBar(
        backgroundColor: const Color(0xFF27A776),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text('Kido', style: TextStyle(color: Colors.white)),
        actions: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Jaden Smith',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.white)),
                  Text('750 Stars ⭐',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.white)),
                ],
              ),
              const SizedBox(width: 8),
              const CircleAvatar(
                  backgroundImage: AssetImage('pictures/profile.png')),
              const SizedBox(width: 12),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF27A776),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('pictures/profile.png'),
                  ),
                  const SizedBox(height: 8),
                  Text('Hello, Jaden!',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _numberCard(
              context: context,
              title: 'English Number',
              subtitle: 'Learn 1 to 100',
              numbers: ['1\nOne', '2\nTwo', '3\nThree'],
              points: ['Numbers 1-10', 'Number Names', 'Counting Practice'],
              buttonText: 'Start Learning Numbers',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnglishNumbersPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            _numberCard(
              context: context,
              title: 'বাংলা সংখ্যা',
              subtitle: '১ থেকে ১০০ পর্যন্ত',
              numbers: ['১\nএক', '২\nদুই', '৩\nতিন'],
              points: ['১-১০ পর্যন্ত সংখ্যা', 'সংখ্যার নাম', 'গণনা অনুশীলন'],
              buttonText: 'সংখ্যা শেখা শুরু করুন',
              onPressed: () {
                // Future support
              },
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF583EFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    'Choose your preferred number system! ✨',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'আপনার পছন্দের সংখ্যা বেছে নিন! ✨',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF4CAF50), // Green for selected
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Clips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Subjects',
          ),
        ],
      ),
    );
  }

  Widget _numberCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required List<String> numbers,
    required List<String> points,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF583EFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(title,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: numbers.map((num) => _numberBox(num)).toList(),
          ),
          const SizedBox(height: 12),
          ...points.map((point) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                const Icon(Icons.check_circle,
                    color: Colors.green, size: 18),
                const SizedBox(width: 8),
                Expanded(
                    child: Text(point,
                        style: GoogleFonts.poppins(fontSize: 14))),
              ],
            ),
          )),
          const SizedBox(height: 12),
          Center(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF27A776),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 32, vertical: 12),
              ),
              child: Text(buttonText,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberBox(String numberText) {
    final parts = numberText.split('\n');
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFE8E6FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(parts[0],
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 16)),
          Text(parts[1], style: GoogleFonts.poppins(fontSize: 12)),
        ],
      ),
    );
  }
}

class LearningVideosPage {
  const LearningVideosPage();
}

class EnglishNumbersPage {
  const EnglishNumbersPage();
}

class MathGamePage {
  const MathGamePage();
}
