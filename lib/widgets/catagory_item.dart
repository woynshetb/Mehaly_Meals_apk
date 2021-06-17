//import 'dart:html';

import 'package:Mehaly_Meals_apk/screens/catagory_meals_screen.dart';
import 'package:flutter/material.dart';

class CatagoryItem extends StatelessWidget {
  // the whote catagory item property ex for vegitable
  final String id;
  final String title;
  final Color color;
  CatagoryItem(this.id, this.title, this.color);

  void selectCatagory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CatagoriesMealsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatagory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
