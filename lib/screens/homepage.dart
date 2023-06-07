import 'dart:convert';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/screens/add_task.dart';
import 'package:to_do_list/widgets/add_task_button.dart';
import 'package:to_do_list/widgets/todo_item.dart';
import 'package:to_do_list/service/responses.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.blue,
                  size: 30,
                )),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
                radius: 20,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "TO-DO LIST",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AddTask(
                    label: '+ Add Task',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateTask()));
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 60,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.blue,
                dayTextStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                dateTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                monthTextStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Container(
                  height: 300,
                  child: FutureBuilder(
                    future: getToDo(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ToDo>> snapshot) {
                      return Expanded(
                        flex: 3,
                        child: ListView.builder(
                            itemCount: snapshot.data != null
                                ? snapshot.data!.length
                                : 0,
                            itemBuilder: (BuildContext context, int index) {
                              final answer = snapshot.data![index];
                              debugPrint("${answer.completed}");
                              return TodoItem(
                                  title: answer.title,
                                  status: answer.completed);
                            }),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
