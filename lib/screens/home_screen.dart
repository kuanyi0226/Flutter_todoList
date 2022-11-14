import 'package:flutter/material.dart';
import 'package:project4_todolist/src/colors.dart';

import '../helpers/drawer_navigation.dart';
import './todo_screen.dart';
import '../src/app.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Useful ToDo List'),
      ),
      drawer: DrawerNavigation(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: subColor,
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TodoScreen())),
        child: Icon(Icons.add),
      ),
    );
  }
}
