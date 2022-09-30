import 'package:flutter/material.dart';
import 'package:ndsn/models/app_theme.dart';
import 'package:ndsn/models/user_chat.dart';
import 'package:ndsn/page/chat_page.dart';
import 'package:ndsn/page/message_page.dart';

import '../models/messages_model.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<UserChatModel> userChatModel;
  

  const ChatBodyWidget({
    required this.userChatModel,
     Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.grey.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3)
              ),
            ],
          ),
          child: buildChats(),
        ),
      );

  Widget buildChats() => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = userChatModel[index];

          return Container(
            height: 75,
            child: ListTile(
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(
                   builder: (context) => MessagePage(userChatModel: user,),
                 ));
              },
              leading: CircleAvatar(
                radius:30,
                backgroundColor: AppTheme.primaryLight,
                backgroundImage: NetworkImage(user.urlImage),
              ),
              title: Text(user.name, style: AppTheme.title2),
              subtitle: Text('Say Hi...',),
              trailing: Text('21:04\n\n', style: AppTheme.caption2),
            ),
          );
        },
        itemCount: userChatModel.length,
      );
}
