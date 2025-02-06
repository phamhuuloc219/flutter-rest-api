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
              trailing: // call button
              Container(
                // profile pic of driver
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                child: IconButton(
                    onPressed:() => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Image(image: NetworkImage(user.avt.thumbnail),width: 150, height: 150,),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text("${user.fullName}", style: TextStyle(fontSize: 20),),
                              Text('Age: ${user.dob.age}'),
                              Text("Gender: ${user.gender}"),
                              Text('Phone: ${user.phone}'),
                              Text('Email: ${user.email}'),
                              Text("Address: ${user.location.city}, ${user.location.country}")
                            ],
                          ),
                        ),
                        actions: [
                          //cancel
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close',style:TextStyle(color: Colors.red),),
                          ),
                        ],
                      ),
                    ),
                    icon: Icon(Icons.more_vert)
                ),
              ),
          ),);
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
