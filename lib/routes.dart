
import 'package:flutter/widgets.dart';
import 'package:mealapp/models/tab_navigation.dart';
import 'package:mealapp/screens/fav_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meal_details.dart';
import 'screens/category_screen.dart';
import 'screens/category_meal.dart';


final Map <String , WidgetBuilder> routes={
  '/': (contexts) => tabNav(),
  CategoryScreen.routeName:(context) => CategoryScreen(),
  categoryMeal.routeName: (context) => categoryMeal(),
  mealDetail.routeName: (context) => mealDetail(),
  favScreen.routeName: (context) => favScreen(),
  filters.routeName: (context) => filters(),
};

