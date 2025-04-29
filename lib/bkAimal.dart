import 'package:flutter/material.dart';
import 'childProfile.dart';
import 'clips.dart';
import 'mathGame.dart';
import 'math.dart';
import 'HomePage.dart';

void main() {
  runApp(const KidoApp());
}

class KidoApp extends StatelessWidget {
  const KidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kido',
      home: const AnimalGridScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimalGridScreen extends StatefulWidget {
  const AnimalGridScreen({super.key});

  @override
  State<AnimalGridScreen> createState() => _AnimalGridScreenState();
}

class _AnimalGridScreenState extends State<AnimalGridScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> animals = [
    {'name': 'Lion', 'desc': 'King of Jungle', 'color': Color(0xFF472BF2)},
    {'name': 'Elephant', 'desc': 'Gentle Giant', 'color': Color(0xFFFF7F7F)},
    {'name': 'Giraffe', 'desc': 'Tall Friend', 'color': Color(0xFF69F079)},
    {'name': 'Tiger', 'desc': 'Jungle Cat', 'color': Color(0xFFC6A5FF)},
    {'name': 'Fox', 'desc': 'Clever One', 'color': Color(0xFFFF89C0)},
    {'name': 'Wolf', 'desc': 'Pack Leader', 'color': Color(0xFF9BE9FF)},
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LearningVideosPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MathGamePage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MathPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: _buildDrawer(),
        appBar: _buildAppBar(),
        body: _buildGridView(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Text('KIDO',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.green),
            title: Text('Settings'),
          ),
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.green),
            title: Text('Help & Support'),
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.green),
            title: Text('About Us'),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.green),
            title: Text('Log Out'),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.green,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white, size: 30),
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      title: const Text(''),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChildProfilePage()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('images/profile/kid avater.jpg'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 25),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: animals.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 3 / 4.5,
        ),
        itemBuilder: (context, index) {
          final animal = animals[index];
          // Pass the animal image name along with other data
          return _buildAnimalCard(
            animal['name'],
            animal['desc'],
            animal['color'],
            '${animal['name'].toLowerCase()}.jpg', // Example: 'lion.jpg'
          );
        },
      ),
    );
  }

  Widget _buildAnimalCard(
      String name, String desc, Color bgColor, String imageName) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Image.asset(
                'images/elephant.jpg',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(desc,
                  style: TextStyle(fontSize: 11, color: Colors.grey[600])),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black54,
      unselectedItemColor: Colors.black54,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 18,
      unselectedFontSize: 16,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.video_library), label: 'Clips'),
        BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset), label: 'Games'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Subjects'),
      ],
    );
  }
}
