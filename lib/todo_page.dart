import 'package:dicoding_submission_1/todo_model.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);

  final titleTextController = TextEditingController();
  final descTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextFormField(
              controller: titleTextController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: descTextController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: ElevatedButton(
          onPressed: () {
            final todoModel = Todo(
                title: titleTextController.text,
                description: descTextController.text,
                createdDate: DateTime.now());

            Navigator.of(context).pop(todoModel);
          },
          child: const Text('Save'),
        ),
      ),
    );
  }
}
