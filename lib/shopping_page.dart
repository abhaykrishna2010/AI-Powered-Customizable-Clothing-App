import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'readymade_clothes.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Abhay!'),
        backgroundColor: const Color(0xFFb56969), // Pinkish theme color
        actions: [
          GestureDetector(
            onTap: () {
              // Navigate to ProfilePage when tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/logo.jpg'), // Your logo image
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Explore
              const Text(
                'EXPLORE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFb56969),
                ),
              ),
              const Text(
                'Choose one of the options below',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),

              // Product Options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildProductOption('Design Using AI', 'assets/images/tshirt.png'),
                  _buildProductOption('Ready Made for U!', 'assets/images/tie_dye.png'),
                ],
              ),
              const SizedBox(height: 20),

              // Gift Basket Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReadyMadeClothesPage()),
                  );
                  },
                  icon: const Icon(Icons.card_giftcard),
                  label: const Text('Make A Gift Basket'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    foregroundColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // AI Image Generator Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to AI image generator page
                    Navigator.pushNamed(context, '/ai_generated_image');
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('AI Image Generator'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Section: Customer Reviews
              const Text(
                'Customer Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Review Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildReviewCard('gigi@12', 'The designs created were so good!', 'assets/images/profile1.png', 5),
                  _buildReviewCard('Krabby12', 'AI designs were better than expected!', 'assets/images/profile2.png', 5),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for displaying product options
  Widget _buildProductOption(String title, String imagePath) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 100),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for displaying review cards
  Widget _buildReviewCard(String username, String review, String imagePath, int rating) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 10),
          Text(
            username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            review,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(rating, (index) {
              return const Icon(Icons.star, color: Colors.yellow);
            }),
          ),
        ],
      ),
    );
  }
}
