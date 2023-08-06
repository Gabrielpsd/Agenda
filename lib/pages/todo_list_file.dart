import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todoTasks = [];

  final TextEditingController fieldTasks = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                ListView(
                  shrinkWrap: true,
                  children: [
                    for (String todo in todoTasks)
                      ListTile(
                        title: Text(todo),
                        subtitle: Text("21/01/2023"),
                        leading: Icon(Icons.save),
                        onTap: () {
                          print("Tarefa $todo");
                        },
                      ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text("VOce possu 0 tarefas pendentes"),
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
    );
  }

  void insertTask() {
    todoTasks.add(fieldTasks.text);
    setState(() {});
  }
}
