import 'package:flutter/material.dart';
import 'package:mealapp/models/my_drawer.dart';

class filters extends StatefulWidget {
  static final routeName = '/filt_screen';

  const filters();

  @override
  _filtersState createState() => _filtersState();
}

class _filtersState extends State<filters> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updatedValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updatedValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  "Gluten Free",
                  "Include All Meals Gluten Free ",
                  _GlutenFree,
                  (newValue) {
                    setState(
                      () {
                        _GlutenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  "Lactose Free",
                  "Include All Meals Lactose Free ",
                  _LactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _LactoseFree = newValue;
                      },
                    );
                  },
                ),

                buildSwitchListTile(
                  "Vegetarian ",
                  "Include All Meals Vegetarian ",
                  _Vegetarian,
                      (newValue) {
                    setState(
                          () {
                        _Vegetarian = newValue;
                      },
                    );
                  },
                ),

                buildSwitchListTile(
                  "Vegan",
                  "Include All Meals Vegan ",
                  _Vegan,
                  (newValue) {
                    setState(
                      () {
                        _Vegan = newValue;
                      },
                    );
                  },
                ),

              ],
            ),
          ),
        ],
      ),
      drawer: myDrawer(),
    );
  }
}
