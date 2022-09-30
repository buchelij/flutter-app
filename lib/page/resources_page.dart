import 'package:flutter/material.dart';
import '../models/app_theme.dart';
import '../models/resources_model.dart';
import '../utils/app_utils.dart';

class ResourcesPage extends StatelessWidget {
  int selectedIndex = 0;
  List<String> blogTypes = [
    "All",
    "Trademark",
    "Talking Heads",
    "Other",
  ];

    List catList = [
      {
        "image": "assets/chart.png",
        "title" : "Forum",
        "articles": "160 articles",
      },
      {
        "image": "assets/idea.png",
        "title" : "Legal",
        "articles": "200 articles",
      },
      {
        "image": "assets/rocket.png",
        "title" : "Marketing",
        "articles": "140 articles",
      }
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0, width: 9),
            Text.rich(TextSpan(children: [
              TextSpan(text: " Trending", style: TextStyle(fontSize: 26)),
              TextSpan(text: " ", style: AppTheme.headline),
              TextSpan(
                  text: "Blog",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))
            ])),
            SizedBox(height: 22),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      blogTypes.length,
                      (index) => GestureDetector(
                            onTap: () => setState(() {
                              selectedIndex = index;
                            }),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Column(
                                children: [
                                  Text(blogTypes[index],
                                      style: TextStyle(
                                          color: selectedIndex == index
                                              ? AppTheme.ndsnPink
                                              : AppTheme.black,
                                          fontWeight: selectedIndex == index
                                              ? FontWeight.bold
                                              : FontWeight.normal)),
                                  Container(
                                      height: 4.0,
                                      width: 4.0,
                                      margin: EdgeInsets.only(top: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: selectedIndex == index
                                            ? AppTheme.ndsnPink
                                            : AppTheme.white,
                                      ))
                                ],
                              ),
                            ),
                          )),
                )),
            SizedBox(height: 24),
            Stack(
              children: [
                Container(
                  height: 250.0,
                  width: 380,
                  margin: EdgeInsets.only(right: 5, left: 5),
                  decoration: BoxDecoration(
                    color: AppTheme.ndsnPink,
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: AssetImage("assets/business.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 24,
                  child: Container(
                    height: 34.0,
                    width: 75.0,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                        color: AppTheme.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(children: [
                      Image.asset(
                        "assets/heart.png",
                        height: 25,
                        width: 25,
                      ),
                      Text(
                        "480",
                        style: AppTheme.body1,
                      ),
                    ]),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    children: [
                      Text(
                        "How to build a trademark",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      //SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("   "),
                          Image.asset("profile.png", height: 40, width: 40),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: Text(
                            "Peter Parker",
                            style: AppTheme.body1,
                          )),
                          Text("10 June 2022    ")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 24),
            Text(
              "    Useful Tools",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Container(
              height: 162,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: catList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 162,
                      width: 120,
                      margin: EdgeInsets.only(right: 5, left: 5),
                      decoration: BoxDecoration(
                          color: AppTheme.ndsnPink,
                          borderRadius: BorderRadius.circular(18)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 24),
                            child: Image.asset(
                              catList[index]["image"],
                              height: 32,
                              width: 32,
                            ),
                          ),
                          Text(
                            catList[index]["title"],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            catList[index]["articles"],
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ])),
    );
  }

  setState(Null Function() param0) {}
  // body: buildContent(),
}
