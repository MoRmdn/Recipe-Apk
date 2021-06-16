import 'package:flutter/material.dart';
import 'package:mealapp/models/my_drawer.dart';
class filters extends StatelessWidget {
  static final routeName ='/filt_screen';
  const filters();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
      body: null,
      drawer: myDrawer(),
    );
  }
}
