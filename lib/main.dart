import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tugas_todo_app/components/_divider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MyTodoApp(title: 'Nar | To-Do List App'),
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
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  void addTask(String task) {
    setState(() {
      tasks.add(task);
      taskController.clear();
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 153, 255),
        toolbarHeight: 70,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Start of Input Add Task
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 25,
              right: 25,
              bottom: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 153, 255),
                            width: 2.0),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      labelText: 'Add New Task ...',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      addTask(taskController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(13.5),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: const Icon(
                    size: 40,
                    Icons.add,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // End of Input Add Task
          const MyDivider(),
          // Start of Tasks Card List
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 5,
                  ),
                  child: SimpleShadow(
                    color: const Color.fromARGB(255, 179, 179, 179),
                    opacity: 0.4,
                    offset: const Offset(3, 3),
                    sigma: 6,
                    child: Card(
                      elevation: 3,
                      shadowColor: const Color.fromARGB(255, 179, 179, 179),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: ListTile(
                          title: Text(
                            tasks[index],
                            style: const TextStyle(
                              letterSpacing: 1,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              removeTask(index);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 18),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                              ),
                            ),
                            child: const Icon(
                              size: 30,
                              Icons.delete,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // End of Task Card List
        ],
      ),
    );
  }
}
