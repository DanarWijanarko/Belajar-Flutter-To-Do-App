import 'package:flutter/material.dart';

class MyInputTask extends StatefulWidget {
  const MyInputTask({super.key});

  @override
  State<MyInputTask> createState() => _MyInputTaskState();
}

class _MyInputTaskState extends State<MyInputTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 25,
        right: 25,
        bottom: 10,
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 255, 128), width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelText: 'Add New Task ...',
              ),
            ),
          ),
          // const SizedBox(
          //   width: 3,
          // ),
          // IconButton(
          //   onPressed: () {},
          //   tooltip: 'Add Task',
          //   hoverColor: const Color.fromARGB(255, 0, 255, 128),
          //   icon: const Icon(
          //     Icons.add,
          //     color: Colors.grey,
          //   ),
          // ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(EdgeInsets.all(14)),
            ),
            child: const Icon(
              size: 39,
              Icons.add,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
