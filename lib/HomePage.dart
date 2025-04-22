import 'package:flutter/material.dart';
import 'math.dart';
import 'art.dart';
import 'bkAimal.dart';
import 'childProfile.dart';
import 'clips.dart';
import 'mathGame.dart';
import 'learningVideosPage.dart'; // Ensure this file contains the LearningVideosPage class

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0; // 👈 "Clips" is selected by default

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LearningVideosPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MathGamePage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MathPage()),
      );// Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectsPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(title: Text('Profile')),
            ListTile(title: Text('Settings')),
            ListTile(title: Text('Help & Support')),
            ListTile(title: Text('About Us')),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white, size: 29),

          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: const Text(
          'KIDO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChildProfilePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Icon(Icons.person, color: Colors.green),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Jaden Smith',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Categories', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ..._buildCategoryCards(screenWidth, screenHeight),
            const SizedBox(height: 20),
            const Text("Today's Challenges 🏆", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _challengeCardWithButtonAtBottom('Daily Quiz', "Complete today's fun quiz!", Icons.quiz, Colors.amber, () {}, 'Start Quiz'),
            const SizedBox(height: 10),
            _challengeCardWithButtonAtBottom('Story Time', 'Read "The Magic Forest"!', Icons.book, Colors.redAccent, () {}, 'Read Now'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 18,
        unselectedFontSize: 16,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Clips'),
          BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: 'Games'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Subjects'),
        ],
      ),
    );
  }

  List<Widget> _buildCategoryCards(double screenWidth, double screenHeight) {
    List<Map<String, dynamic>> categories = [
      {
        'title': 'Basic Knowledge',
        'icon': Icons.lightbulb_outline,
        'description': 'Learn fun facts about the world!',
        'tags': ['Animals', 'Birds', 'Flowers'],
        'color': Colors.pink[100],
        'buttonColor': Colors.pinkAccent,
        'onPressed': (BuildContext context) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AnimalGridScreen()),
          );
        },
      },
      {
        'title': 'Language Learning',
        'icon': Icons.language,
        'description': 'Improve your Bengali & English!',
        'tags': ['Bengali', 'English'],
        'color': Colors.blue[100],
        'buttonColor': Colors.blueAccent,
        'onPressed': null,
      },
      {
        'title': 'Math Adventure',
        'icon': Icons.calculate,
        'description': 'Master numbers & logic puzzles!',
        'tags': ['Numbers', 'Puzzles'],
        'color': Colors.green[100],
        'buttonColor': Colors.green,
        'onPressed': (BuildContext context) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MathPage()),
          );
        },
      },
      {
        'title': 'Art and Creativity',
        'icon': Icons.palette,
        'description': 'Draw, color, and express ideas!',
        'tags': ['Canvas', 'Art-board'],
        'color': Colors.purple[100],
        'buttonColor': Colors.purple,
        'onPressed': (BuildContext context) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreativityStudioScreen()),
          );
        },
      },
      {
        'title': 'Social Studies',
        'icon': Icons.people_alt,
        'description': 'Learn kindness and good habits!',
        'tags': ['Etiquette', 'Good things'],
        'color': Colors.yellow[100],
        'buttonColor': Colors.orangeAccent,
        'onPressed': null,
      },
      {
        'title': 'Science Lab',
        'icon': Icons.science,
        'description': 'Explore discoveries and experiments!',
        'tags': ['Experiments', 'Discovery'],
        'color': Colors.red[100],
        'buttonColor': Colors.redAccent,
        'onPressed': null,
      },
    ];

    return categories.map((category) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        height: 180,
        decoration: BoxDecoration(
          color: category['color'],
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(category['icon'], color: Colors.black87),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    category['title'],
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(category['description'], style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: (category['tags'] as List<String>).map((tag) {
                return Chip(
                  label: Text(tag, style: const TextStyle(fontSize: 12)),
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),
                );
              }).toList(),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  final Function(BuildContext)? action = category['onPressed'];
                  if (action != null) action(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: category['buttonColor'],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Explore', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _challengeCardWithButtonAtBottom(String title, String description, IconData icon, Color color, VoidCallback onTap, String buttonText) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      height: 160,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Text(description, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(buttonText, style: const TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}