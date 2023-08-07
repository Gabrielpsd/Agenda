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
  Todo? deletedItem;
  int? position;

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
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orangeAccent),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Adicione uma Tarefa',
                            hintText: 'Ex. Estudar Flutter',
                            labelStyle: TextStyle(color: Colors.orangeAccent),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => insertTask(),
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
                          TodoListItems(todoItem: todo, onDelete: onDelete),
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
                        onPressed: () =>
                            deleteAllTodoDialog(), //deleteAllTodoDialog(),
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
    setState(() {
      Todo newTodo = Todo(title: fieldTasks.text, dateTime: DateTime.now());
      todoTasks.add(newTodo);
    });
  }

  void onDelete(Todo todo) {
    deletedItem = todo;
    position = todoTasks.indexOf(todo);

    setState(() {
      todoTasks.remove(todo);
    });

    //it is important to clear other snacks that is in the screen

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text("Tarefa ${todo.title} removida "),
        backgroundColor: Colors.orangeAccent,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              todoTasks.insert(position!, todo!);
            });
          },
        ),
      ),
    );
  }

  deleteAllTodoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Deletar tudo"),
        content: Text("Voce deseja deletar tudo ? "),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("cancelar")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                deleteAlltodos();
              },
              child: Text("Limpar Tudo")),
        ],
      ),
    );
  }

  void deleteAlltodos() {
    setState(() {
      todoTasks.clear();
    });
  }
}
