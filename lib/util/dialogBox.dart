import 'package:flutter/material.dart';
import 'package:todo_app/util/myButton.dart';
import 'package:todo_app/util/to_do_tile.dart';


class Dialogbox extends StatelessWidget {

 VoidCallback onSave;
 VoidCallback onCancel;

   Dialogbox({super.key ,
   required this.controller,
   required this.onCancel,
   required this.onSave,
   });
final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    backgroundColor: Colors.white,
    content: Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller ,
            decoration: InputDecoration(border: OutlineInputBorder() ,
            hintText: "give your task"
            ),
          ),
          //for buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                //save
              Mybutton(text: "save", onPressed: onSave),
              const SizedBox(width: 8,),
                //cancel
              Mybutton(text: "cancel", onPressed: onCancel),
            ],
          )


        ],
      ),
    ),
    );
  }
}