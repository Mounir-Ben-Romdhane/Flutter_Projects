import 'package:flutter/material.dart';
import 'package:flutter_project/models/user/user_model.dart';



class UsersScreen extends StatelessWidget {

  List<UserModel> users = 
  [
    UserModel(
        id: 1,
        name: "mounir brm",
        phone: "93881881"),
    UserModel(
        id: 2,
        name: "mamcavnbrm",
        phone: "93881881"),
    UserModel(
        id: 3,
        name: "mouniac avkjr brm",
        phone: "93881881"),
    UserModel(
        id: 4,
        name: "mouniamvmr brm",
        phone: "93881881"),
    UserModel(
        id: 5,
        name: "mounamvvir brm",
        phone: "93881881"),
    UserModel(
        id: 1,
        name: "mounir brm",
        phone: "93881881"),
    UserModel(
        id: 2,
        name: "mamcavnbrm",
        phone: "93881881"),
    UserModel(
        id: 3,
        name: "mouniac avkjr brm",
        phone: "93881881"),
    UserModel(
        id: 4,
        name: "mouniamvmr brm",
        phone: "93881881"),
    UserModel(
        id: 5,
        name: "mounamvvir brm",
        phone: "93881881"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users'
        ),
      ),
      body: ListView.separated(itemBuilder: (context , index ) => buildListUser(users[index]),
          separatorBuilder: (context , index ) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: users.length),
    );
  }

  // 1. build item
  // 2. build list
  // 3. add item to list

  Widget buildListUser(UserModel model) => Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children:
      [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${model.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              '${model.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${model.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
