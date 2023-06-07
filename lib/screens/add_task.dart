import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/widgets/input_field.dart';

import '../service/responses.dart';
// import 'package:http/http.dart ' as http;

DateTime selectedDate = DateTime.now();

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _dateController = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _datecontroller = TextEditingController();
  final TextEditingController _desccontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "ADD TASK",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            children: [
              InputField(
                title: "Name",
                hint: "Enter task name",
                controller: _namecontroller,
              ),
              InputField(
                title: "Notes",
                hint: "Enter task description",
                controller: _desccontroller,
              ),
              InputField(
                title: "Date",
                hint: DateFormat.yMd().format(selectedDate),
                widget: IconButton(
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        dateFromDatePicker = selectedDate.day.toString();
                        dateFromDatePicker += "/";
                        dateFromDatePicker += selectedDate.month.toString();
                        dateFromDatePicker += "/";
                        dateFromDatePicker += selectedDate.year.toString();

                        _dateController.text = dateFromDatePicker;
                      });
                    }
                  },
                ),
                controller: _datecontroller,
              ),
              InputField(title: "Reminder", hint: "1 hour before"),
              InputField(title: "Urgency", hint: "Low priority"),
              const SizedBox(
                height: 20,
              ),
              // DatePicker(
              //   DateTime.now(),
              //   initialSelectedDate: DateTime.now(),
              //   selectionColor: Colors.blue,
              // ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  final item = {
                    "id": _namecontroller.text,
                    "title": _namecontroller.text,
                    "description": _desccontroller.text,
                    "completed": false,
                    "created": _datecontroller.text,
                    "lastUpdated": DateTime.now().toString(),
                  };
                  addToDo(item);
                  Navigator.pop(
                    context,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Create Task",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// getDateFromUser() async {
//   DateTime? pickerDate = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(2020),
//     lastDate: DateTime(2030),
//   );
//   if (pickerDate != null) {
//     _selectedDate = pickerDate;
//   } else {
//     print("Something is wrong");
//   }
// }
