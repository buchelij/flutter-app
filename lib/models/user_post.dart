import 'package:ndsn/models/user.dart';

class UserPostModel {
  User user;
  String? image;
  String caption;
  String title;
  Map<User,String>? comments; //TODO: How to map when getting the data?
  dynamic likes;

  UserPostModel(
      {required this.user,
      required this.caption,
      this.comments,
      this.image,
      this.title = ""});

  //Dummy data
  // final List<UserPostModel> dummyData = [
  //   UserPostModel(
  //       user: dummyUsers[1],
  //       caption: "In this post the sky is blue and the ground is flourishing.",
  //       comments: [
  //         "Excellent Work!",
  //         "This is amazing, good job!",
  //         "Keep up the good work"
  //       ],
  //       image: "https://random.imagecdn.app/500/500"),
  //   UserPostModel(
  //       user: dummyUsers[2],
  //       caption: "In this post the sky is blue and the ground is flourishing.",
  //       comments: [
  //         "Excellent Work!",
  //         "This is amazing, good job!",
  //         "Keep up the good work"
  //       ])
  // ];
}
