import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'tshirt_preview.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _userInput = TextEditingController();
  Uint8List? _imageBytes;
  final List<Message> _messages = [];

  // Hugging Face API credentials
  final String apiUrl = "https://api-inference.huggingface.co/models/black-forest-labs/FLUX.1-dev";
  final String apiKey = "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";

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
          _messages.add(Message(
            isUser: false,
            imageBytes: _imageBytes,
            date: DateTime.now(),
          ));
        });
      } else {
        print('Failed to generate image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> sendMessage() async {
    final message = _userInput.text;
    setState(() {
      _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
    });

    await generateImage(message); // Generate the image with the entered text prompt
    _userInput.clear();
  }

  void navigateToTshirtPreview() {
    if (_imageBytes != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TshirtPreviewPage(imageBytes: _imageBytes!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                    isUser: message.isUser,
                    message: message.message,
                    imageBytes: message.imageBytes,
                    date: DateFormat('HH:mm').format(message.date),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 15,
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _userInput,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            label: Text('Enter Your Prompt'),
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        padding: EdgeInsets.all(12),
                        iconSize: 30,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(CircleBorder()),
                        ),
                        onPressed: sendMessage,
                        icon: Icon(Icons.send),
                      ),
                    ],
                  ),
                  if (_imageBytes != null) // Only show button if an image is generated
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                        onPressed: navigateToTshirtPreview,
                        child: Text("Create T-Shirt"),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String? message;
  final Uint8List? imageBytes;
  final DateTime date;

  Message({required this.isUser, this.message, this.imageBytes, required this.date});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String? message;
  final Uint8List? imageBytes;
  final String date;

  const Messages({
    super.key,
    required this.isUser,
    this.message,
    this.imageBytes,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: isUser ? Colors.blueAccent : Colors.grey.shade400,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: isUser ? Radius.circular(10) : Radius.zero,
          topRight: Radius.circular(10),
          bottomRight: isUser ? Radius.zero : Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message != null)
            Text(
              message!,
              style: TextStyle(fontSize: 16, color: isUser ? Colors.white : Colors.black),
            ),
          if (imageBytes != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.memory(imageBytes!),
            ),
          Text(
            date,
            style: TextStyle(fontSize: 10, color: isUser ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
