import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter REST API"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          // final color = user.gender == 'male' ? Colors.blue : Colors.green;
          return ListTile(
            title: Text(user.name.first + " " + user.name.last),
            subtitle: Text(user.phone),
            // tileColor: color,
          );
      },),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }
  void fetchUsers() async{
    print("add user called");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      return User(
        cell: e['cell'],
        email: e['email'],
        phone: e['phone'],
        nat: e['nat'],
        gender: e['gender'],
        name: name,
      );
    } ).toList();
    setState(() {
      users = transformed;
    });
    print("fetch user completed");
  }
}
