import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tugas_todo_app/components/_divider.dart';
import 'package:tugas_todo_app/components/input_add_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MyTodoApp(title: 'To-Do List App'),
    );
  }
}

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({super.key, required this.title});

  final String title;

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 255, 128),
        toolbarHeight: 70,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const MyInputTask(),
          const MyDivider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: List<Widget>.generate(40, (index) {
                  return Column(
                    children: [
                      SimpleShadow(
                        color: const Color.fromARGB(255, 179, 179, 179),
                        opacity: 0.4,
                        offset: const Offset(3, 3),
                        sigma: 6,
                        child: _cardList(),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _cardList() {
    return Card(
      // elevation: 3,
      // shadowColor: Color.fromARGB(255, 179, 179, 179),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      color: Colors.white,
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Ini adalah To-Do list pertama',
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
