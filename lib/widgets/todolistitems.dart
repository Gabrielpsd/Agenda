import 'package:calculator/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoListItems extends StatelessWidget {
  const TodoListItems({super.key, required this.todoItem});

  final Todo todoItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('dd/MMM/yyyy - HH:mm EE').format(todoItem.dateTime),
            style: TextStyle(fontSize: 12),
          ),
          Text(
            todoItem.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
