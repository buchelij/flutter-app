import 'dart:math';
import 'package:flutter/material.dart';
import '../models/user.dart';

enum CardStatus { like, dislike, superLike }

class CardProvider extends ChangeNotifier {
  List<User> _users = [];
  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  List<User> get users => _users;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

  CardProvider() {
    resetUsers();
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;

    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();

    final status = getStatus(force: true);

    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      case CardStatus.superLike:
        superLike();
        break;
      default:
        resetPosition();
    }
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  double getStatusOpacity() {
    final delta = 100;
    final pos = max(_position.dx.abs(), _position.dy.abs());
    final opacity = pos / delta;

    return min(opacity, 1);
  }

  CardStatus? getStatus({bool force = false}) {
    final x = _position.dx;
    final y = _position.dy;
    final forceSuperLike = x.abs() < 20;

    if (force) {
      final delta = 100;

      if (x >= delta) {
        return CardStatus.like;
      } else if (x <= -delta) {
        return CardStatus.dislike;
      } else if (y <= -delta / 2 && forceSuperLike) {
        return CardStatus.superLike;
      }
    } else {
      final delta = 20;

      if (y <= -delta * 2 && forceSuperLike) {
        return CardStatus.superLike;
      } else if (x >= delta) {
        return CardStatus.like;
      } else if (x <= -delta) {
        return CardStatus.dislike;
      }
    }
  }

  void dislike() {
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  void superLike() {
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _nextCard();

    notifyListeners();
  }

  Future _nextCard() async {
    if (users.isEmpty) return;

    await Future.delayed(Duration(milliseconds: 200));
    _users.removeLast();
    resetPosition();
  }

  void resetUsers() {
    _users = <User>[
      User(
        name: 'Steffi',
        age: 20,
        Userid: 1,
        urlImage:
            'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YnVzaW5lc3MlMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        description:"Hi!👋🏻 Im Steffi, a 20 year old IT consultant based in Southwark, London",
        keyword1: "IT",
        keyword2: "Digital Marketing",
        keyword3: "Art",
        keyword4: "Media",
        keyword5: "Socials",
      ),
      User(
        name: 'Joel',
        age: 24,
        Userid: 2,
        urlImage:
            'https://www.gannett-cdn.com/presto/2019/10/17/PREN/e8577b3a-3aed-48ae-b09d-84916c526562-davegamble.jpg?crop=2846,3794,x152,y0&quality=50&width=640',
        description:"Motivational speaker, life coach and aspiring author.",
        keyword1: "Reading",
        keyword2: "Speaking",
        keyword3: "Art",
        keyword4: "Creative",
        keyword5: "Presenting",
      ),
      User(
        name: 'Johanna',
        age: 21,
        Userid: 3,
        urlImage:
            'https://eiko.ai/eiko/meero/61EumC3myGnHVsEWnny6fflcQYU/eyJpbnB1dCI6eyJzb3VyY2VzIjpbImh0dHBzOlwvXC9tZWRpYS5tZWVyby5jb21cL2Jsb2ctbWVkaWFcLzQxMVwvMDVhMjcxMjctOTNjZS00NjFmLTlkNjUtYTk0OTlkNjYyNTgwLmpwZyJdfSwib3BlcmF0aW9ucyI6W3sidHlwZSI6InJlc2l6ZSIsIndpZHRoIjoxMDI0fV0sIm91dHB1dCI6eyJxdWFsaXR5Ijo3MH19',
              keyword1: "Money",
        description:"Banking is my main industry, however I'd love to explore the digital marketing field!📱",
        keyword2: "Banking",
        keyword3: "ICT",
        keyword4: "London",
        keyword5: "Digital Marketing",
      ),
      User(
        name: 'Vince',
        age: 22,
        Userid: 4,
        urlImage:
            'https://media.gq-magazine.co.uk/photos/5e7ccfc0525b920008162b30/master/w_1920,h_1280,c_limit/20200326-New-music-update-03.jpg',
        description:"One musician searching for another! 🎸 Based in Nottingham ",
        keyword1: "Instruments",
        keyword2: "Music",
        keyword3: "Singing",
        keyword4: "Design",
        keyword5: "Artistic",
      ),
      User(
        name: 'Emily',
        age: 29,
        Userid: 5,
        urlImage:
            'https://eiko.ai/eiko/meero/8R9LFPXTkUU_McipJ22yTb3mXjo/eyJpbnB1dCI6eyJzb3VyY2VzIjpbImh0dHBzOlwvXC9tZWRpYS5tZWVyby5jb21cL2Jsb2ctbWVkaWFcLzQxMVwvZDU2MWU3NzQtZjNlNS00NmIzLWJkZTMtMTAyMzhiMzRmYWU5LmpwZyJdfSwib3BlcmF0aW9ucyI6W3sidHlwZSI6InJlc2l6ZSIsIndpZHRoIjoxMDI0fV0sIm91dHB1dCI6eyJxdWFsaXR5Ijo3MH19',
        description:"Female computer scientist seeking new opportunities 💻 Love my dog, family & making new friends",
        keyword1: "IT",
        keyword2: "Computer Science",
        keyword3: "App Development",
        keyword4: "Social Media",
        keyword5: "Robotics",
      ),
      User(
        name: 'Simon',
        age: 23,
        Userid: 6,
        urlImage:
            'https://media.istockphoto.com/photos/m-here-to-make-it-happen-picture-id968943486?k=20&m=968943486&s=612x612&w=0&h=DVMqJFniEy6bWWVzw_48mp_eSWaGdfSRs4vqUH4hFTM=',
        description:"Recently graduated with a 1:1 in Digital Media ",
        keyword1: "Media",
        keyword2: "IT",
        keyword3: "Global News",
        keyword4: "Journalism",
        keyword5: "Creative",
      ),
      User(
        name: 'Deja',
        age: 25,
        Userid: 7,
        urlImage:
            'https://images.unsplash.com/photo-1562904403-a5106bef8319?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80',
        description:"Disney studios apprentice looking for new projects!",
        keyword1: "Animation",
        keyword2: "Design",
        keyword3: "Art",
        keyword4: "Videography",
        keyword5: "Photoshop",
      ),
      User(
        name: 'Sandeep',
        age: 29,
        Userid: 8,
        urlImage:
            'https://media.istockphoto.com/photos/portrait-of-an-indian-businessman-picture-id465984840?k=20&m=465984840&s=612x612&w=0&h=1nMhPSKRDDFfripgaNFy94ndEdvV-tgsGLgws7quZI8=',
        description:"Hi! Im Sandeep, 7 years of solicitor experience.",
        keyword1: "Solicitor",
        keyword2: "Law",
        keyword3: "Court",
        keyword4: "Legal Jurisdictions",
        keyword5: "Qualified",
      ),
      User(
        name: 'Ella',
        age: 23,
        Userid: 9,
        urlImage:
            'https://images.unsplash.com/photo-1563178406-4cdc2923acbc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=396&q=80',
        description:"3rd year student at Univeristy of Lincoln studying Pyschology ",
        keyword1: "Pyscology",
        keyword2: "Maths",
        keyword3: "Reading",
        keyword4: "Music",
        keyword5: "Creative",
      ),
      User(
        name: 'Divya',
        age: 28,
        Userid: 10,
        urlImage:
            'https://media.istockphoto.com/photos/lead-yourself-to-a-life-of-success-picture-id1299077558?k=20&m=1299077558&s=612x612&w=0&h=PU8JRoL6gRWYh1YDPtYjP45y7BUzFS3_mzQ1H9gumwk=',
        description:"Media Journilist for the Greenwhich Gazette.",
        keyword1: "Media",
        keyword2: "News",
        keyword3: "Journalism",
        keyword4: "Critical",
        keyword5: "Hardworking",
      ),
      User(
        name: 'Lee',
        age: 26,
        Userid: 11,
        urlImage:
            'https://dl.acm.org/do/10.1145/contrib-99659319011/rel-img-name-aff/profile-smaller.jpg',
        description:"PHD researcher for bio-engineering🧪",
        keyword1: "Biology",
        keyword2: "Engineering",
        keyword3: "Maths",
        keyword4: "Music",
        keyword5: "Creative",
      ),
      User(
        name: 'Ben',
        age: 27,
        Userid: 12,
        urlImage:
            'https://www.corporatephotographerslondon.com/wp-content/uploads/2016/07/approachable-professional-headshots-London.jpg',
        description:"Insurance broker apprentice working in Canada Water",
        keyword1: "Biology",
        keyword2: "Engineering",
        keyword3: "Reading",
        keyword4: "Music",
        keyword5: "Creative",
      ),
      User(
        name: 'Vaishni',
        age: 25,
        Userid: 13,
        urlImage:
            'https://media.istockphoto.com/photos/studying-on-campus-picture-id1318948090?b=1&k=20&m=1318948090&s=170667a&w=0&h=NB3FF6NGfqAMKnKPCr1hh9-Z27xpdLgU0coArzjy4Ak=',
        description:"2nd year student at Univeristy East London studying Business Management ",
        keyword1: "Business",
        keyword2: "Finance",
        keyword3: "Management",
        keyword4: "Hardworking",
        keyword5: "London",
      ),
      User(
        name: 'Nour',
        age: 29,
        Userid: 14,
        urlImage:
            'https://images.unsplash.com/photo-1621274790572-7c32596bc67f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dW5pdmVyc2l0eSUyMHN0dWRlbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
        description:"Employed at HSBC as a financial advisor💸.",
        keyword1: "Finance",
        keyword2: "Maths",
        keyword3: "Banking",
        keyword4: "Financial Advisor",
        keyword5: "Hardworking",
      ),
      User(
        name: 'Kelson',
        age: 24,
        Userid: 15,
        urlImage:
            'https://www.fyimusicnews.ca/sites/default/files/styles/article_page_image/public/field/image/50856814_318483445676138_7273288255464800256_nmalachb.jpg?itok=ggVfDf-4',
        description:"Aspiring music producer🤙🏻",
        keyword1: "Musician",
        keyword2: "Producer",
        keyword3: "DJ",
        keyword4: "Drummer",
        keyword5: "Creative",
      ),
      User(
        name: 'Lana',
        age: 23,
        Userid: 16,
        urlImage:
            'https://media.istockphoto.com/photos/its-like-holding-hundreds-of-books-in-my-hands-picture-id878868618?k=20&m=878868618&s=612x612&w=0&h=f43OwpTEZP8V2Thr6XWThRfHQI87PJNz5uPgEBh-4qs=',
        description:"Fashion,creative art and design are all my thing!🎨 ",
        keyword1: "Fashion",
        keyword2: "Style",
        keyword3: "Art",
        keyword4: "Hardworking",
        keyword5: "Creative",
      ),
      User(
        name: 'David',
        age: 32,
        Userid: 17,
        urlImage:
            'https://media.istockphoto.com/photos/portrait-smiling-african-american-businessman-in-blue-suit-sit-at-picture-id1341347262?k=20&m=1341347262&s=612x612&w=0&h=4LmTjpj964uaqdRtfiCui6Rc-CyOnbPBrsG8f3YtaEw=',
        description:"Senior Manager at KPMG, Canary Wharf.",
        keyword1: "Central London",
        keyword2: "Corporate Tax",
        keyword3: "Finance",
        keyword4: "Banking",
        keyword5: "Experienced",
      ),
      User(
        name: 'Nasiba',
        age: 23,
        Userid: 18,
        urlImage:
            'https://images.unsplash.com/photo-1608453162650-cba45689c284?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHVuaXZlcnNpdHklMjBzdHVkZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        description:"Student nurse specialising in cardiology.🫀",
        keyword1: "Nurse",
        keyword2: "Biology",
        keyword3: "Research",
        keyword4: "Science",
        keyword5: "Caridology",
      ),
      User(
        name: 'Bart',
        age: 22,
        Userid: 19,
        urlImage:
            'https://images.unsplash.com/photo-1600178596957-93549ca39c0c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHVuaXZlcnNpdHklMjBzdHVkZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        description:"Aspiring film producer. Currently working @ sony🎥",
        keyword1: "Filmography",
        keyword2: "Producer",
        keyword3: "Photography",
        keyword4: "Cinemography",
        keyword5: "Creative",
      ),
      User(
        name: 'Sonny',
        age: 22,
        Userid: 20,
        urlImage:
            'https://media.istockphoto.com/photos/african-student-sitting-in-classroom-picture-id1351445530?b=1&k=20&m=1351445530&s=170667a&w=0&h=9Lmy0oy3tqoFgvuIPhEKPhbNQrLR12Ym518Zjs-KpF4=',
        description:"Media student in my 3rd year at University of Birmingham.",
        keyword1: "Media",
        keyword2: "News",
        keyword3: "Journalism",
        keyword4: "Critical",
        keyword5: "Hardworking",
      ),
      User(
        name: 'Micheal',
        age: 38,
        Userid: 21,
        urlImage:
            'https://media.istockphoto.com/photos/man-with-happy-face-working-at-office-while-looking-at-camera-picture-id1288694691?k=20&m=1288694691&s=612x612&w=0&h=VRfyNuK2rpis3f1YpQwLEMzFu1kYiU1OMlniLO0PvE4=',
        description:"7 years incurance broker experience. Working at Hiscox",
        keyword1: "Insurance",
        keyword2: "Legal Claims",
        keyword3: "Finance",
        keyword4: "Business",
        keyword5: "Experienced",
      ),
    ].reversed.toList();

    notifyListeners();
  }
}