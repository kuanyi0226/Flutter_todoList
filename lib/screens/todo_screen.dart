import 'package:flutter/material.dart';

import '../models/category.dart';
import '../services/category_service.dart';
import '../src/colors.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var todoTitleController = TextEditingController();
  var todoDescripController = TextEditingController();
  var todoDateController = TextEditingController();

  var _selectedValue;
  List<DropdownMenuItem> _categories = <DropdownMenuItem>[];

  _loadCategories() async {
    var _categoryService = CategoryService();
    var categories = await _categoryService.readCategories();
    categories.forEach((categ) {
      setState(() {
        _categories.add(DropdownMenuItem<String>(
          child: Text(
            categ['name'],
            style: TextStyle(color: Colors.white),
          ),
          value: categ['name'],
        ));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Todo',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          //Enter title
          TextField(
            controller: todoTitleController,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: 'Title',
              hintText: 'Write Todo Title',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          //Enter Description
          TextField(
            controller: todoDescripController,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Write Todo Description',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          //Enter Date
          TextField(
            controller: todoDateController,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: 'Date',
              hintText: 'Pick a Date',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              prefixIcon: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //Select a category by pull down button
          DropdownButtonFormField<dynamic>(
            dropdownColor: subColor,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            value: _selectedValue,
            items: _categories,
            hint: Text('Category', style: TextStyle(color: Colors.white)),
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: Text('Save'),
            style: ElevatedButton.styleFrom(primary: subColor),
          )
        ]),
      ),
    );
  }
}
