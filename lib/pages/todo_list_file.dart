import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  //each controller is emended with only one textField camp
  final TextEditingController emailcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailcontroler,
                decoration: InputDecoration(
                  labelText: 'E- mail',
                  hintText: 'exemplo@exemplo.com',
                  border: OutlineInputBorder(),
                  //obscureText: true
                ),
                onChanged: funcaoOnChanged,
                onSubmitted: functionOnSubmited,
              ),
              ElevatedButton(onPressed: login, child: Text('Entrar '))
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    String text = emailcontroler.text;
    print(text);
  }

  void funcaoOnChanged(String text) {
    print(text);
  }

  void functionOnSubmited(String value) {
    print(value);
  }
}
