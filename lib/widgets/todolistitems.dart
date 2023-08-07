import 'package:calculator/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class TodoListItems extends StatelessWidget {
  const TodoListItems(
      {super.key, required this.todoItem, required this.onDelete});

  final Todo todoItem;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.5,
        children: [
          SlidableAction(
            onPressed: (context) {
              onDelete(todoItem);
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
            label: 'Delete',
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
      ),
    );
  }
}
