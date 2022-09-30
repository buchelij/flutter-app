import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ndsn/page/chat_page.dart';
import '../models/app_theme.dart';
import 'package:provider/provider.dart';
import '../models/cardProvider.dart';

import '../page/events_page.dart';
import '../page/network_page.dart';
import '../page/home_page.dart';
import '../page/resources_page.dart';

import '../widget/navigation_drawer_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => CardProvider(),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primaryColor:AppTheme.ndsnPink),
        home: MainPage(),
      ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _myPage;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 1);
  }
int _selectedPage = 0;

 final _pageOptions = [
    HomePage(),
    EventsPage(),
    NetworkPage(),
    ResourcesPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
  return new Scaffold(
    key:_scaffoldKey,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 233, 233),
        elevation: 10,
        title: Image.asset('assets/NDSN.png', fit: BoxFit.cover,height: 55,),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.forum_rounded,color: AppTheme.black,),
            onPressed: () => Navigator.push
            (
              context, 
              MaterialPageRoute(builder: (context) =>  ChatPage())
            )
           ),
            ],
        leading: IconButton (
          icon: Icon(Icons.menu,color: Color.fromARGB(255, 248, 73, 186)),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),),
          ),

        body:
           _pageOptions[_selectedPage],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color.fromARGB(255, 235, 233, 233),
              selectedItemColor: AppTheme.ndsnPink,
              unselectedItemColor: Colors.black,
              iconSize: 40,
              currentIndex:_selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage  = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon:Icon(Icons.home),
                  label: 'HOME',
                  ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.calendar_month),
                  label:'EVENTS',
                  ),
                 BottomNavigationBarItem(
                  icon:Icon(Icons.people_alt),
                  label:'NETWORK',
                  ),
                 BottomNavigationBarItem(
                  icon:Icon(Icons.topic),
                  label:'RESOURCES',
                  ),
              ],
          ),
    ); 
  }
}