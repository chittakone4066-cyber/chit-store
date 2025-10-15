import 'package:flutter/material.dart';
import 'package:flutter_defaulttabcontroller/login_page.dart';
import 'package:flutter_defaulttabcontroller/nav.dart';
import 'package:flutter_defaulttabcontroller/pages/cart_page.dart';
import 'pages/home_page.dart';
import 'pages/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      ),
      home: const LoginPage(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Nav(),
        appBar: AppBar(
          title: const Text(
            "Store page",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 227, 225, 58),
            ),
          ),
          backgroundColor: Colors.deepPurple,
          bottom: const TabBar(
            indicatorColor: Colors.yellow,
            indicatorWeight: 4,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white70,
            isScrollable: false,
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.person), text: "User"),
              Tab(icon: Icon(Icons.info), text: "Card"),
            ],
          ),
        ),
        body: const TabBarView(children: [HomePage(), UserPage(), CartPage()]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("ຢ່າກົດດດ")));
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
