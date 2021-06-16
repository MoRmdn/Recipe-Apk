import 'package:flutter/material.dart';
import './routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      routes: routes,
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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
