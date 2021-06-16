import 'package:flutter/material.dart';
import 'package:mealapp/widget/category_item.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = '/catScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map(
                (catData) =>
                    categoryItem(catData.id, catData.title, catData.color),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
