import 'package:flutter/material.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/models/my_drawer.dart';
import 'package:mealapp/screens/category_screen.dart';
import 'package:mealapp/screens/fav_screen.dart';

class tabNav extends StatefulWidget {
  const tabNav() ;
  
  @override
  _tabNavState createState() => _tabNavState();
}

class _tabNavState extends State<tabNav> {
  @override
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIn]['title']),
      ),
      body: pages[selectedPageIn]['page'],
      bottomNavigationBar:BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).accentColor ,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor:Colors.white,
        currentIndex: selectedPageIn,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            title: Text('Category') ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Favorite') ,
          ),
        ],

      ),
      drawer: myDrawer(),
    );
  }
  List <Map<String,Object>> pages=[
    {
      'page':CategoryScreen(),
      'title':'Categories',
    },
    {
      'page':favScreen(),
      'title': 'Favorite',
    },
  ];
  var selectedPageIn =0;
  void _selectPage(var value) {
    setState(() {
      selectedPageIn=value;
    });
  }
}
