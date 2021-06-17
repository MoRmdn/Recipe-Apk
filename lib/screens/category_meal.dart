import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import '../dummy_data.dart';
import '../widget/meal_item.dart';
import 'package:mealapp/main.dart';

class categoryMeal extends StatefulWidget {
  static String routeName = '/catMeal';
  List<Meal> avaiMeal;
  categoryMeal(this.avaiMeal);

  @override
  _categoryMealState createState() => _categoryMealState();
}

// ignore: camel_case_types
class _categoryMealState extends State<categoryMeal> {
  String catId;
  String catTitle;
  List<Meal> displayedMeal;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    catId = routeArg['id'];
    catTitle = routeArg['title'];
    displayedMeal = widget.avaiMeal.where((index) {
      return index.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  /*void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }*/

  @override
  Widget build(BuildContext context) {

/*    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catId = routeArg['id'];
    final catTitle = routeArg['title'];
    final displayedMeal = DUMMY_MEALS.where((index) {
      return index.categories.contains(catId);
    }).toList();*/

    return Scaffold(
      appBar: AppBar(
        title: Text('$catTitle'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return mealItem(
            id:displayedMeal[index].id,
            imageUrl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
            duration: displayedMeal[index].duration,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
