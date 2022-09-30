import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndsn/main.dart';
import 'package:ndsn/widget/numbers_widget.dart';
import '../models/app_theme.dart';
import 'package:ndsn/models/user.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserPage({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppTheme.ndsnPink, elevation: 0.0,
        title: Text('My Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () => Navigator.pop(context, MaterialPageRoute(builder: (context) =>  MainPage()) ),
        )),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }
  

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://res-3.cloudinary.com/fieldfisher/image/upload/c_lfill,g_auto/f_auto,q_auto/v1/sectors/technology/tech_neoncircuitboard_857021704_medium_lc5h05',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  
  Widget buildProfileImage() => CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: profileHeight / 2 - 6,
        backgroundColor: AppTheme.lightGrey,
        backgroundImage: NetworkImage(urlImage),
      ),
    );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          Text(
           name,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Flutter Software Engineer',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.slack,),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.github),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.twitter),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.linkedin),
            ],
          ),
          const SizedBox(height: 10),
          NumbersWidget(),
          Divider(),
          //const SizedBox(height: 16),
          //NumbersWidget(),
          const SizedBox(height: 16),
          buildKeywords(),
          Divider(),
          const SizedBox(height: 10),
          buildAbout(),
          const SizedBox(height: 32),
        ],
      );
 Widget buildKeywords() => Container(
        child: Wrap(
          alignment: WrapAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
            child: Text(
              " Software Engingeering ",
              style: TextStyle(fontSize: 22, color: Colors.white, backgroundColor:AppTheme.ndsnPink),
            ),
            ),
            SizedBox(width:4,height:30),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
            child: Text(
              " London ",
              style: TextStyle(fontSize: 22, color: Colors.white, backgroundColor:AppTheme.ndsnPink),
            ),
            ),
            SizedBox(width:4,height:30),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
            child: Text(
              " App Development ",
              style: TextStyle(fontSize: 22, color: Colors.white, backgroundColor:AppTheme.ndsnPink),
            ),
            ),
            SizedBox(width:4,height:30),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
            child: Text(
              " Creative ",
              style: TextStyle(fontSize: 22, color: Colors.white, backgroundColor:AppTheme.ndsnPink),
            ),
            ),
            SizedBox(width:4,height:30),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
            child: Text(
              " Computer Science ",
              style: TextStyle(fontSize: 22, color: Colors.white, backgroundColor: AppTheme.ndsnPink),
            ),
            ),
          ],
        ),
      );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: AppTheme.headline,
            ),
            const SizedBox(height: 16),
            Text(
              'Flutter Software Engineer and Google Developer Expert for Flutter & Dart with years of experience as a consultant for multiple companies in Europe, USA and Asia. My mission is to create a better world with beautiful Flutter app designs and software!',
              style: AppTheme.body1,
            ),
          ],
        ),
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: AppTheme.ndsnPink,
          child: InkWell(
            onTap: () {},
            child: Center(child: Icon(icon, size: 32)),
          ),
        ),
      );
}
