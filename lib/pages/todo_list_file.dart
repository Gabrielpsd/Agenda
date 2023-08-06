import 'package:calculator/models/todo.dart';
import 'package:flutter/material.dart';

import '../widgets/todolistitems.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Todo> todoTasks = [];

  final TextEditingController fieldTasks = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: fieldTasks,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adicione uma Tarefa',
                            hintText: 'Ex. Estudar Flutter',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: insertTask,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffEDBC39),
                          padding: const EdgeInsets.all(14),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (Todo todo in todoTasks)
                          TodoListItems(todoItem: todo),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                            "VOce possu ${todoTasks.length} tarefas pendentes"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffEDBC39),
                          padding: const EdgeInsets.all(14),
                        ),
                        child: Text("Limpar tudo"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void insertTask() {
    Todo newTodo = Todo(title: fieldTasks.text, dateTime: DateTime.now());

    todoTasks.add(newTodo);
    setState(() {});
  }
}
