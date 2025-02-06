import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user.dart';
import 'package:flutter_rest_api/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];


  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

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
          return Card(
            child: ListTile(
              leading: Image(image: NetworkImage(user.avt.thumbnail)),
              title: Text(user.name.first + " " + user.name.last),
              subtitle: Text(user.phone),
              trailing: Icon(Icons.more_vert),
              // tileColor: color,
            ),
          );
      },),
    );
  }
  void fetchUsers() async{
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
