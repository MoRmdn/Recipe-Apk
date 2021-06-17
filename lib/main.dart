import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/tab_navigation.dart';
import 'package:mealapp/screens/fav_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meal_details.dart';
import 'models/meal.dart';
import 'screens/category_screen.dart';
import 'screens/category_meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegetarian': false,
    'Vegan': false,
  };

  List <Meal> favMeal=[];

  void taggleFav(String mealId){
    final existingIndex=favMeal.indexWhere((meal) => meal.id==mealId);
    if (existingIndex >= 0) {

      setState(() {
        favMeal.removeAt(existingIndex);
      }
      );

    }

    else{

      setState(() {
        favMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      }
      );

    }

  }

  bool isMealFav(String Id){
    return favMeal.any((meal) => meal.id == Id);

  }




  List<Meal> _avaiMeal = DUMMY_MEALS;

  void selectedFilters(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;
        _avaiMeal = DUMMY_MEALS.where(
          (meal) {
            if (_filters['Gluten'] && !meal.isGlutenFree) {
              return false;
            }

            if (_filters['Lactose'] && !meal.isLactoseFree) {
              return false;
            }

            if (_filters['Vegetarian'] && !meal.isVegetarian) {
              return false;
            }

            if (_filters['Vegan'] && !meal.isVegan) {
              return false;
            }

            return true;
          },
        ).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(70, 162, 159, 1),
        accentColor: Color.fromRGBO(32, 40, 51, 1),
        canvasColor: Color.fromRGBO(197, 198, 200, 1),
      ),
      /*home:CategoryScreen(),*/
      /*initialRoute: CategoryScreen.routeName,*/
      routes: {
        '/': (contexts) => tabNav(favMeal),
        CategoryScreen.routeName: (context) => CategoryScreen(),
        categoryMeal.routeName: (context) => categoryMeal(_avaiMeal),
        mealDetail.routeName: (context) => mealDetail(taggleFav,isMealFav),
        filters.routeName: (context) => filters(selectedFilters, _filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: null,
    );
  }
}
