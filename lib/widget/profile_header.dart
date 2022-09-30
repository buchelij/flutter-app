import 'package:flutter/material.dart';
import 'package:ndsn/models/app_theme.dart';
import 'package:ndsn/page/profile_page.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final String urlImage;
  final String jobTitle;

  const ProfileHeaderWidget( {
    required this.name,
    required this.urlImage,
    required this.jobTitle,
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 80,
        padding: EdgeInsets.all(16).copyWith(left: 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(color: Colors.black),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      color: AppTheme.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {                 
                    Navigator.of(context).push(MaterialPageRoute(
                   builder: (context) => ProfilePage(keyword1: '', name: name, urlImage: urlImage, jobTitle: jobTitle,)));
                   },
               icon: Icon(Icons.person)),
                    SizedBox(width: 12),
                    buildIcon(Icons.call,),
                    SizedBox(width: 12),
                    buildIcon(Icons.videocam),
                  ],
                ),
                SizedBox(width: 4),
              ],
            )
          ],
        ),
      );

  Widget buildIcon(IconData icon) => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white54,
        ),
        child: Icon(icon, size: 25, color: Colors.black),
      );
}