import 'package:flutter/material.dart';
import 'package:ndsn/main.dart';
import 'package:ndsn/models/app_theme.dart';
import 'package:ndsn/models/user_chat.dart';
import 'package:ndsn/page/chat_page.dart';
import 'package:ndsn/page/home_page.dart';
import 'package:ndsn/page/message_page.dart';

class ChatHeaderWidget extends StatelessWidget {
  final List<UserChatModel> userChatModel;

  const ChatHeaderWidget({
    required this.userChatModel,
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        width: double.infinity,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize:25,fontWeight: FontWeight.w600,),
                  children: [
                    WidgetSpan(
                      child:  IconButton
                      (icon:Icon(Icons.arrow_back), 
                    onPressed: () => Navigator.pop(
                    context, MaterialPageRoute(builder: (context) =>  MainPage()) ),
                      )),
                    TextSpan(
                        text: '                                      ',
                      ),
                    TextSpan(
                        text: 'Chat',
                      )
                  ]
                )),
            SizedBox(height: 8),
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userChatModel.length,
                itemBuilder: (context, index) {
                  final user = userChatModel[index];
                  if (index == 0) {
                    return Container(
                      margin: EdgeInsets.only(right: 12),
                       child: CircleAvatar(
                         radius: 36,
                         backgroundColor: AppTheme.primaryLight,
                         child: Icon(Icons.search,size: 35,color: AppTheme.dark_grey,),
                       ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MessagePage(userChatModel: userChatModel[index]),
                          ));
                        },
                        child: CircleAvatar(
                          radius: 36,
                          backgroundColor: AppTheme.primaryLight,
                          backgroundImage: NetworkImage(user.urlImage),
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      );
}