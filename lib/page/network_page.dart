
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/app_theme.dart';

import '../widget/swipeCard.dart';
import '../models/cardProvider.dart';

class NetworkPage extends StatefulWidget {
  @override
  _NetworkPageState createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              alignment: Alignment.topCenter,
              //padding: EdgeInsets.all(3),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Expanded(child: buildCards()),
                  const SizedBox(height: 16),
                  //buildButtons(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final users = provider.users;

    return users.isEmpty
        ? Center(
          child: Container(
            child: Text(
              '\n You have networked with all our members! \n \n Check back later for more... \n',
              style: AppTheme.headline,
              textAlign: TextAlign.center,
              )
          )
        )

        : Stack(
            children: users
                .map((user) => TinderCard(
                      user: user,
                      isFront: users.last == user,
                    ))
                .toList(),
          );
  }

  Widget buildButtons() {
    final provider = Provider.of<CardProvider>(context);
    final users = provider.users;
    final status = provider.getStatus();
    final isLike = status == CardStatus.like;
    final isDislike = status == CardStatus.dislike;
    final isSuperLike = status == CardStatus.superLike;

    return users.isEmpty
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              'Restart',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              final provider =
                  Provider.of<CardProvider>(context, listen: false);

              provider.resetUsers();
            },
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  //shape: MaterialState,
                  foregroundColor:
                      getColor(AppTheme.white, Colors.white, isDislike),
                  backgroundColor:
                      getColor(AppTheme.orange, Colors.red, isDislike),
                 // side: getBorder(AppTheme.white, Colors.white, isDislike),
                ),
                child: Icon(Icons.clear, size: 46),
                onPressed: () {
                  final provider =
                      Provider.of<CardProvider>(context, listen: false);

                  provider.dislike();
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      getColor(AppTheme.white, Colors.white, isSuperLike),
                  backgroundColor:
                      getColor(AppTheme.lime, Colors.blue, isSuperLike),
                  //side: getBorder(Colors.blue, Colors.white, isSuperLike),
                ),
                child: Icon(Icons.star_border_purple500, size: 40),
                onPressed: () {
                  final provider =
                      Provider.of<CardProvider>(context, listen: false);

                  provider.superLike();
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: getColor(AppTheme.white, Colors.white, isLike),
                  backgroundColor: getColor(AppTheme.orange, Colors.green, isLike),
                  //side: getBorder(Colors.teal, Colors.white, isLike),
                ),
                child: Icon(Icons.favorite_outline_outlined, size: 40),
                onPressed: () {
                  final provider =
                      Provider.of<CardProvider>(context, listen: false);

                  provider.like();
                },
              ),
            ],
          );
  }

  MaterialStateProperty<Color> getColor(
      Color color, Color colorPressed, bool force) {
    final getColor = (Set<MaterialState> states) {
      if (force || states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };

    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<BorderSide> getBorder(
      Color color, Color colorPressed, bool force) {
    final getBorder = (Set<MaterialState> states) {
      if (force || states.contains(MaterialState.pressed)) {
        return BorderSide(color: Colors.transparent);
      } else {
        return BorderSide(color: color, width: 2);
      }
    };

    return MaterialStateProperty.resolveWith(getBorder);
  }
}