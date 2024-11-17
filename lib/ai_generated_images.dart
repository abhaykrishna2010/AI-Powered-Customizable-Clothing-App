import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data'; // To handle byte arrays

class AiGeneratedImagePage extends StatefulWidget {
  const AiGeneratedImagePage({super.key});

  @override
  _AiGeneratedImagePageState createState() => _AiGeneratedImagePageState();
}

class _AiGeneratedImagePageState extends State<AiGeneratedImagePage> {
  final TextEditingController _controller = TextEditingController();
  Uint8List? _imageBytes;

  // Hugging Face API credentials
  final String apiUrl = "https://api-inference.huggingface.co/models/black-forest-labs/FLUX.1-dev";
  final String apiKey = "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"; // Add your key here

  // Function to send prompt and get image
  Future<void> generateImage(String prompt) async {
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"inputs": prompt}),
      );

      if (response.statusCode == 200) {
        setState(() {
          _imageBytes = response.bodyBytes;
        });
      } else {
        print('Failed to generate image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI-Generated Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your prompt',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                generateImage(_controller.text);
              },
              child: const Text('Generate Image'),
            ),
            const SizedBox(height: 20),
            _imageBytes != null
                ? Image.memory(_imageBytes!) // Display generated image
                : const Text('No image generated yet'),
          ],
        ),
      ),
    );
  }
}
