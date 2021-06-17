import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

// ignore: camel_case_types
class mealDetail extends StatelessWidget {
  static String routeName = '/mealdet';
  final Function taggleFav;
  final Function isMealFav;
  mealDetail(this.taggleFav,this.isMealFav);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildSelectinBody(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.lightBlueAccent,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 250,
      height: 100,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildSelectinBody(
              ListView.builder(
                itemBuilder: (contex, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    selectMeal.ingredients[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildSelectinBody(
              ListView.builder(
                itemBuilder: (contex, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(selectMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    )),
                itemCount: selectMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>taggleFav(mealId),
        child: Icon(
          isMealFav(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
