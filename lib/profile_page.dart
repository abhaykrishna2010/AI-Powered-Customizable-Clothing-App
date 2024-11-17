import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2DAD2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD69B91),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Abhay Krishna',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/logo.jpg'), // Your logo image
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Krabby123@gmail.com',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ProfileOption(
              label: 'Your Orders',
              icon: Icons.shopping_bag,
              onTap: () {
                // Navigate to Orders page
              },
            ),
            ProfileOption(
              label: 'Addresses',
              icon: Icons.location_on,
              onTap: () {
                // Navigate to Addresses page
              },
            ),
            ProfileOption(
              label: 'Saved Payments',
              icon: Icons.account_balance_wallet,
              onTap: () {
                // Navigate to Saved Payments page
              },
            ),
            ProfileOption(
              label: 'Ratings and Reviews',
              icon: Icons.star,
              onTap: () {
                // Navigate to Ratings and Reviews page
              },
            ),
            ProfileOption(
              label: 'Offers',
              icon: Icons.local_offer,
              onTap: () {
                // Navigate to Offers page
              },
            ),
            ProfileOption(
              label: 'Settings',
              icon: Icons.settings,
              onTap: () {
                // Navigate to Settings page
              },
            ),
            ProfileOption(
              label: 'Support',
              icon: Icons.headset_mic,
              onTap: () {
                // Navigate to Support page
              },
            ),
            ProfileOption(
              label: 'Sign Out',
              icon: Icons.logout,
              onTap: () {
                // Sign out logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileOption({super.key, 
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(icon, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
