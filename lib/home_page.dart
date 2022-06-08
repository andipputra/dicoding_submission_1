import 'package:dicoding_submission_1/todo_model.dart';
import 'package:dicoding_submission_1/todo_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoList = <Todo>[];
  bool isMobile = false;

  void toToDoPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TodoPage()))
        .then((value) {
      if (value != null && value is Todo) {
        setState(() {
          todoList.add(value);
        });
      }
    });
  }

  // void checkWidth(BoxConstraints constraints){
  //   if(constraints.maxWidth > 600){
  //     setState(() {
  //       isMobile
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        // checkWidth(constraints);

        return GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context, i) => Card(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(todoList[i].title),
                  Text(todoList[i].description),
                  Text(todoList[i].createdDate.toIso8601String()),
                ],
              ),
            ),
          ),
          itemCount: todoList.length,
        );
      }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: ElevatedButton(
          onPressed: toToDoPage,
          child: const Text('Add Task'),
        ),
      ),
    );
  }
}
