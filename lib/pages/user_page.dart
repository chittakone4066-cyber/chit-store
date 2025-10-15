import 'package:flutter/material.dart';
import 'package:flutter_defaulttabcontroller/pages/user_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_defaulttabcontroller/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<User> users = [];
  bool isLoading = true;
  String? errorMessage;

  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/users'),
      );

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        setState(() {
          users = data.map((e) => User.formJson(e)).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load User';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Center(child: Text(errorMessage!)),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('User Page')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Text(user.id.toString()),
              title: Text(
                user.fname,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(user.lname),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetail(user: user),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
