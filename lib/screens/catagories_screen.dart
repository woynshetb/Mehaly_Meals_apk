import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/catagory_item.dart';

class CatagoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      // GRID VIEW INSTEAD OF lIST VIEW B/C WE WANTS ITEMS side by side (the products)
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((catData) =>
              CatagoryItem(catData.id, catData.title, catData.color))
          .toList(), //list of catagories

      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // max width of item 200px
        childAspectRatio: 3 / 2, // how items resized regarding height and width
        crossAxisSpacing: 20, // distance b/n columns
        mainAxisSpacing: 20, // distance b/n rows in that grid
      ),
    );
  }
}

class Edge {}
