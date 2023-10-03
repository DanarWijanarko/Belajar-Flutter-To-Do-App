import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Divider(
        color: Colors.grey,
        height: 2,
        thickness: 1,
        // indent: 10,
        // endIndent: 10,
      ),
    );
  }
}
