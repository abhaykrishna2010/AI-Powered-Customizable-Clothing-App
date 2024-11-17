import 'package:flutter/material.dart';
import '/screens/home_screen.dart';
import 'startup.dart';
import 'screens/products/product_details.dart';
import 'screens/products/product_list.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FilleSansPeurApp',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: WelcomePage(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ProductList.routeName: (ctx) => ProductList(),
        ProductDetails.routeName: (ctx) => ProductDetails(),
      },
    );
  }
}
