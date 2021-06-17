import 'package:Mehaly_Meals_apk/models/meal.dart';
import 'package:Mehaly_Meals_apk/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CatagoriesMealsScreen extends StatefulWidget {
  static const routeName = '/catagory-meals';
  final List<Meal> availableMeals;
  CatagoriesMealsScreen(this.availableMeals);
  @override
  _CatagoriesMealsScreenState createState() => _CatagoriesMealsScreenState();
}

class _CatagoriesMealsScreenState extends State<CatagoriesMealsScreen> {
  String catagoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      catagoryTitle = routeArgs['title'];
      final catagoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.catagories.contains(catagoryId);
      }).toList();

      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catagoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
