import 'package:flutter/material.dart';

import 'model.dart';

class ItemListUser extends StatelessWidget {
  const ItemListUser({Key? key, required this.userList, required this.index})
      : super(key: key);
  final List<User> userList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
          child: Text(
            userList[index].name!,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Text(
            'Username: ${userList[index].username!}',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Text(
            'Email: ${userList[index].email!}',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Text(
            'Address: ${userList[index].address?.suite}, ${userList[index].address?.street}, ${userList[index].address?.city}, ${userList[index].address?.zipcode}',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Text(
            'Phone number: ${userList[index].phone}',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 12.0),
          child: Text(
            'Website: ${userList[index].website}',
            style:  TextStyle(
                color: Colors.blue.shade900,
                fontSize: 18.0,
                fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
