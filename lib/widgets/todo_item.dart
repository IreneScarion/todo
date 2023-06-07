import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final bool status;

  const TodoItem({super.key, required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        leading: const Icon(
          Icons.check_circle,
          color: Colors.blue,
        ),
        tileColor: const Color.fromARGB(255, 233, 232, 232),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: status ? TextDecoration.lineThrough : null),
        ),
      ),
    );
  }
}
