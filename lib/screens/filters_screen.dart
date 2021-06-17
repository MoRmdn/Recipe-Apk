import 'package:flutter/material.dart';
import 'package:mealapp/models/my_drawer.dart';

class filters extends StatefulWidget {
  static final routeName = '/filt_screen';

  final Function selectedFilters;
  final Map currFilters;
  filters(this.selectedFilters,this.currFilters);

  @override
  _filtersState createState() => _filtersState();
  }

class _filtersState extends State<filters> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegetarian = false;
  bool _Vegan = false;

  @override
  initState(){
    _GlutenFree=widget.currFilters['Gluten'];
    _LactoseFree=widget.currFilters['Lactose'];
    _Vegetarian=widget.currFilters['Vegetarian'];
    _Vegan=widget.currFilters['Vegan'];
    super.initState();
  }

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
        title: Text('Filters'),actions: [
          IconButton(icon:Icon(Icons.save) , onPressed: (){
            Map<String,bool> selectedFilters={
            'Gluten': _GlutenFree,
            'Lactose': _LactoseFree,
            'Vegetarian': _Vegetarian,
            'Vegan': _Vegan,
            };
            widget.selectedFilters(selectedFilters);
          },
          ),
      ],
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
