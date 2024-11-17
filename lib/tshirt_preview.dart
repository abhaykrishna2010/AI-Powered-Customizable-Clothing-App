import 'dart:typed_data';
import 'package:flutter/material.dart';

class TshirtPreviewPage extends StatelessWidget {
  final Uint8List imageBytes;

  const TshirtPreviewPage({Key? key, required this.imageBytes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T-Shirt Preview'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // T-shirt background image
            Image.asset(
              'assets/images/tshirt.png', // Ensure this is a plain white T-shirt image
              fit: BoxFit.cover,
              height: 400, // Adjust size to fit your design
            ),
            // AI-generated image overlay
            Image.memory(
              imageBytes,
              width: 150, // Adjust width and height as needed
              height: 150,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
