import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widget/meal_item.dart';


class favScreen extends StatelessWidget {
  static final routeName = '/favScreen';
  List <Meal> favMeal;
  favScreen(this.favMeal);


  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return Center(
        child: Text('add your favorite Meals'),
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return mealItem(
            id: favMeal[index].id,
            imageUrl: favMeal[index].imageUrl,
            title: favMeal[index].title,
            duration: favMeal[index].duration,
            affordability: favMeal[index].affordability,
            complexity: favMeal[index].complexity,
          );
        },
        itemCount: favMeal.length,
      );
    }
  }
}