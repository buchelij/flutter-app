import 'package:flutter/material.dart';
import 'package:ndsn/page/create_post_page.dart';
import 'package:ndsn/widget/user_post.dart';

import '../models/user.dart';
import '../models/user_post.dart';

class HomePage extends StatelessWidget {
  final List<UserPostModel> dummyPosts = [
    UserPostModel(
        user: dummyUsers[1],
        caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque neque nunc, dignissim at lacus ac, maximus imperdiet nisi. Aenean fermentum quam enim, quis auctor ante convallis vitae. Nunc elementum elit sed augue vulputate congue. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus in dignissim mi. Sed ultricies turpis lorem, ut fringilla magna vestibulum eget. Maecenas ut turpis vel risus consequat aliquam. Nam euismod pretium lacus, nec sollicitudin arcu iaculis sed. Maecenas euismod neque lectus, at vehicula turpis ullamcorper vitae. Ut quis ante tincidunt, condimentum urna in, cursus mauris.Praesent a luctus tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sit amet enim arcu. Etiam molestie leo iaculis purus mattis scelerisque. Vivamus tincidunt vitae est ut auctor. Fusce vestibulum imperdiet aliquam. Vestibulum dignissim cursus nisl, sed laoreet ante varius ut. Donec id ornare neque. Nam a eros libero. Proin eget rutrum diam, et volutpat diam. Fusce vestibulum tincidunt libero at hendrerit. Nullam lorem odio, tempus non mattis quis, dignissim non ipsum. Nunc molestie ex ac lacinia placerat. Nulla in sagittis ipsum.",
        comments: null,
        image: "https://random.imagecdn.app/500/500"),
    UserPostModel(
        user: dummyUsers[2],
        caption: "In this post the sky is blue and the ground is flourishing.",
        comments: null,
      image: "https://random.imagecdn.app/500/500"
    ),
    UserPostModel(
        user: dummyUsers[3],
        caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque at tellus non justo facilisis eleifend ut eget est. Aenean fringilla volutpat lacus, in consequat massa aliquam in. Pellentesque et diam vel urna ultricies mattis sed nec eros. Donec sed mi vulputate velit placerat pulvinar sit amet in sem. ",
        comments: null,
        image: "https://random.imagecdn.app/500/500"
    )
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ListView.separated(
            shrinkWrap: true,
            itemCount: dummyPosts.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (context, index) {
              return UserPost(post: dummyPosts[index]);
            }),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add, color: Theme.of(context).canvasColor,),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () { 
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePostPage()));
      },
    ),
      );
}
