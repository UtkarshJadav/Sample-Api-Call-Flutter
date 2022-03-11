import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/user_details.dart';

import 'item_list.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> userList = [];

  Future<List<User>?> getUserData() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      final responseBody = response.body;
      return userFromJson(responseBody);
    }
  }

  apiCall() async {
    List<User>? data = await getUserData();
    userList.clear();
    userList.addAll(data!);
  }

  @override
  Widget build(BuildContext context) {
    apiCall();
    return Scaffold(
      appBar: AppBar(
        title: const Text('USER DATA'),
      ),
      body: FutureBuilder(
        future: getUserData(),
        builder: (BuildContext context, AsyncSnapshot<List<User>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              itemCount: userList.length,
              separatorBuilder: (context, index) => const Divider(
                height: 0.5,
                thickness: 0.5,
                color: Colors.black,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailsScreen(id: userList[index].id),
                    ),
                  );
                },
                child: ItemListUser(
                  userList: userList,
                  index: index,
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
