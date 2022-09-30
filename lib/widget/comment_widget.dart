import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ndsn/models/user.dart';

class Comment extends StatelessWidget {
  final User user;
  final String comment;
  final DateTime timestamp;

  Comment(
      {
        required this.user,
        required this.comment,
        required this.timestamp});

  // factory Comment.fromDocument(DocumentSnapshot document) {
  //   var data = document.data();
  //   return Comment(
  //     username: data!['username'],
  //     userId: data['userId'],
  //     comment: data["comment"],
  //     timestamp: data["timestamp"],
  //     avatarUrl: data["avatarUrl"],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(comment),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.urlImage),
          ),
        ),
        Divider(),
      ],
    );
  }
}
