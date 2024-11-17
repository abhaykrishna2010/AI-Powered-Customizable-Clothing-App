import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
          'Register Account',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your full name',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5d3b3b),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your Email address',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5d3b3b),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter your phone number',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5d3b3b),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your unique username',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5d3b3b),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your Password',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5d3b3b),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Registration logic here
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD69B91),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    'Register Account...',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;

  const RegisterTextField({super.key, 
    required this.label,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
