import 'package:calculator/pages/todo_list_file.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove the debug banner
      debugShowCheckedModeBanner: false,
      home: TodoListPage(),
    );
  }
}
