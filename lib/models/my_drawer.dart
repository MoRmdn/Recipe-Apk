import 'package:flutter/material.dart';
import 'package:mealapp/screens/filters_screen.dart';
class myDrawer extends StatelessWidget {
  const myDrawer() ;

  Widget drawerBuilder (IconData I, String title, Function tapHandler ){
    return ListTile(
      leading:Icon(I,size: 26,),
      title: Text(
        '$title', style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      ),
      onTap: tapHandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text('Cooking Up!'
           ,
           style: TextStyle(
             color: Theme.of(context).primaryColor,
             fontSize: 26,
             fontWeight: FontWeight.bold,
           ),
            ),
          ),
          SizedBox(height: 20,),
          drawerBuilder(Icons.restaurant, 'Meal',(){
            Navigator.of(context).pushReplacementNamed('/');
          } ),
          drawerBuilder(Icons.settings, 'Filters',(){
            Navigator.of(context).pushReplacementNamed(filters.routeName);
          } ),
        ],
      ),
    );
  }
}
