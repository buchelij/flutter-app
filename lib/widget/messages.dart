import 'package:flutter/material.dart';
import 'package:ndsn/models/messages_model.dart';
import 'package:ndsn/widget/message.dart';

class MessagesWidget extends StatelessWidget {
  final String name;

  const MessagesWidget({
    required this.name,
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
  body:  SafeArea (
    child:ListView.builder(
      physics: BouncingScrollPhysics(),
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
          return MessageWidget(
            message: message,
            isMe: message.name == 'Sarah',
          );
      }
    )
  )
  );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}