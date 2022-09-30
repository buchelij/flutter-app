import 'package:flutter/material.dart';
import '../models/app_theme.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('FAVOURITES',style: AppTheme.display1,),
          centerTitle: true,
          backgroundColor: AppTheme.ndsnPink,
        ),
      );
}
