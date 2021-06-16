import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mealapp/screens/category_meal.dart';
import '../screens/category_screen.dart';

class categoryItem extends StatelessWidget {
  static String routeName = '/catItem';

  final String id;
  final String title;
  final Color color;

  categoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(categoryMeal.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(0.5),
              color,
            ]),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
