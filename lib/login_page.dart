import 'package:flutter/material.dart';
//import 'shopping_page.dart'; // Import your shopping page
import 'forgotpass_page.dart';
import 'registeration_page.dart'; 
import 'screens/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    String username = usernameController.text;
    String password = passwordController.text;

    // Hardcoded credentials for demo
    if (username == 'user1' && password == 'pass1') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to shopping page
      );
    } else {
      // Show error message if credentials are incorrect
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Login Failed"),
            content: const Text("Invalid Username or Password"),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFf8dcd8), // Light pink background
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Logo
            const CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/logo.jpg'), // Your logo
            ),
            const SizedBox(height: 20),

            // Username Text Field
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'USERNAME',
                hintText: 'Enter your Username',
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

            // Password Text Field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'PASSWORD',
                hintText: 'Enter Password',
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

            // Login Button
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFb56969),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Forgot Password and Registration Links
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Forgot password logic
                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xFFb56969),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Registration logic
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: const Text(  
                'Not yet registered? register now!!!',
                style: TextStyle(
                  color: Color(0xFFb56969),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}