import 'package:intl/intl.dart';


class MessagesModel {
  final int Id;
  final int senderId;
  final int recieverId;
  final String name;
  final String urlImage;
  final String message;
  final DateTime createdAt;
  final String createdAtString;

  const MessagesModel({
    required this.Id,
    required this.senderId,
    required this.recieverId,
    required this.name,
    required this.urlImage,
    required this.message,
    required this.createdAt,
    required this.createdAtString,
    
  });
}

final messages = <MessagesModel>[
  MessagesModel(
    Id: 1,
    senderId: 1,
    recieverId: 2,
    name: 'Steffi',
    urlImage:
    'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YnVzaW5lc3MlMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    message:'Hi',
    createdAt: DateTime.now(),
    createdAtString: DateFormat('jm').format(DateTime.now())),
  MessagesModel(
    Id: 2,
    senderId: 2,
    recieverId: 1,
    name: 'Sarah',
    urlImage:
    'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YnVzaW5lc3MlMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    message:'Hello!',
    createdAt: DateTime.now(),
    createdAtString: DateFormat('jm').format(DateTime.now())),
  MessagesModel(
    Id:3,
    senderId: 2,
    recieverId: 3,
    name: 'Steffi',
    urlImage:
    'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YnVzaW5lc3MlMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    message:'Hi Sarah, thank you for replying. I took a look at your profile and see we have a lot of similar interests.',
    createdAt: DateTime.now(),
    createdAtString: DateFormat('jm').format(DateTime.now())),
  // MessagesModel(
  //   name: 'Joel',
  //   urlImage:
  //   'https://www.gannett-cdn.com/presto/2019/10/17/PREN/e8577b3a-3aed-48ae-b09d-84916c526562-davegamble.jpg?crop=2846,3794,x152,y0&quality=50&width=640',
  //   message:'Hi Sarah, thank you for replying. I took a look at your profile and see we have a lot of similar interests.',
  //   createdAt: DateTime.now(),
  // ),
  
].reversed.toList();