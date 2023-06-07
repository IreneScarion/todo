import 'package:flutter/material.dart';

String dateFromDatePicker = '';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final Widget? widget;
  //final _dateController = TextEditingController();

  final TextEditingController? controller;
   const InputField(
      {super.key,
      required this.title,
      required this.hint,
      this.widget,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5)),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            controller: controller,
                            readOnly: widget == null ? false : true,
                            autofocus: false,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: hint,
                              border: InputBorder.none,
                              // focusedBorder: const UnderlineInputBorder(
                              //     borderRadius: BorderRadius.only(
                              //         bottomRight: Radius.circular(16),
                              //         bottomLeft: Radius.circular(16)),
                              //     borderSide: BorderSide(
                              //       color: Colors.white,
                              //       width: 0,
                              //     ))),
                            ))),
                    widget == null ? Container() : Container(child: widget),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
