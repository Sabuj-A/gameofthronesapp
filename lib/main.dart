import 'package:flutter/material.dart';
import 'package:gameofthronesapp/got_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.black,
fontFamily: 'Pacifico'
      ),
      debugShowCheckedModeBanner: false,
      home: GotPage(),
      
    );
  }
}