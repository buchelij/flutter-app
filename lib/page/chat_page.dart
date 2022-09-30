import 'package:flutter/material.dart';
import 'package:ndsn/models/app_theme.dart';
import 'package:ndsn/models/user_chat.dart';
import 'package:ndsn/widget/chat_body.dart';
import 'package:ndsn/widget/chat_header.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
  return new Scaffold(

  backgroundColor: AppTheme.lightGrey,
  body:  SafeArea (
    child: Column (
      children: [
        ChatHeaderWidget(userChatModel: userChatModel),
        ChatBodyWidget(userChatModel: userChatModel)
      ],
    )
  )
  );
}}