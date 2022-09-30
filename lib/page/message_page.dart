import 'package:flutter/material.dart';
import 'package:ndsn/main.dart';
import 'package:ndsn/models/app_theme.dart';
import 'package:ndsn/models/user_chat.dart';

import 'package:ndsn/widget/messages.dart';
import 'package:ndsn/widget/new_message.dart';
import 'package:ndsn/widget/profile_header.dart';

class MessagePage extends StatefulWidget {
  final UserChatModel userChatModel;

  const MessagePage({
    Key ?key, required this.userChatModel,
  }) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppTheme.lightGrey,
        body: SafeArea(
          child: Column(
             children: [
              ProfileHeaderWidget(
                name: widget.userChatModel.name, 
                urlImage: widget.userChatModel.urlImage, 
                jobTitle:widget.userChatModel.jobTitle,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: MessagesWidget(name: widget.userChatModel.name),
                ),
              ), 
              NewMessageWidget(name: widget.userChatModel.name)
            ],
          ),
        ),
      );
}