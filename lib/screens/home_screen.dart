import 'package:flutter/material.dart';
import 'categories/categories.dart';
import 'home.dart';
import '../profile_page.dart'; 
import '../chatbot.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget _getPage() {
    final List<Widget> pages = [
      const Home(),
      Categories(),
      const ChatScreen(), // Example placeholder
      const Center(child: Text('Explore Page')), // Example placeholder
      const ProfilePage(), // Use the ProfilePage here
    ];

    return pages[_selectedPageIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: const Color.fromARGB(255, 240, 190, 190),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 2, 2, 2),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.tv_outlined),
            label: 'Studio',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: _getPage(),
    );
  }
}
