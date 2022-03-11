import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/user_details_model.dart';
import 'package:flutter_svg/svg.dart';

class UserDetailsScreen extends StatefulWidget {
  final int? id;

  const UserDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  UserDetails? userDetails;

  Future<UserDetails?> getUserDetails() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users/${widget.id}"));
    if (response.statusCode == 200) {
      final responseBody = response.body;
      return userDetailsFromJson(responseBody);
    }
  }

  apiCall() async {
    UserDetails? data = await getUserDetails();
    userDetails = data;
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('USER DETAILS')),
      body: FutureBuilder(
        future: getUserDetails(),
        builder: (BuildContext context, AsyncSnapshot<UserDetails?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (userDetails != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: SvgPicture.asset(
                      "assets/account.svg",
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      userDetails!.name.toString(),
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Username: ${userDetails!.username}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Email: ${userDetails!.email}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      'Address: ${userDetails!.address?.suite}, ${userDetails!.address?.street}, ${userDetails!.address?.city}, ${userDetails!.address?.zipcode}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Phone number: ${userDetails!.phone}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Website: ${userDetails!.website}',
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: Text(
                'No data found! Please try again!!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
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
