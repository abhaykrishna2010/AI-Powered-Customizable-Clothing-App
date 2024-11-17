import 'package:flutter/material.dart';

class ReadyMadeClothesPage extends StatelessWidget {
  const ReadyMadeClothesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Choosing one shirt",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Top section with icons and Discover! text
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.pink.shade100,
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.person, size: 40),
                    Icon(Icons.shopping_cart, size: 40),
                    Icon(Icons.favorite, size: 40),
                    Icon(Icons.snooze, size: 40),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Discover!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Image and Collection Text Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.pink.shade100,
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      "WOMEN'S NEW COLLECTION!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/logo.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
