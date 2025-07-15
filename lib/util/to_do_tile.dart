import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

 final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  
   ToDoTile({super.key ,
   required this.onChanged,
   required this.taskCompleted ,
   required this.taskName,
   required this.deleteFunction
  });
  
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), 
        children: [
          SlidableAction(onPressed: deleteFunction ,
          icon: Icons.delete,
          backgroundColor: Colors.pink,
          borderRadius: BorderRadius.circular(12),)
        ]
        ),
        child: Container(
       padding: EdgeInsets.only(left: 25,right: 25,top: 25,bottom: 0) ,
       
        decoration: BoxDecoration(
        
         
        ),
        child: Row(
          children: [
            //checkbox
           Checkbox(
           value: taskCompleted, 
           onChanged: onChanged,
           activeColor: const Color.fromARGB(255, 231, 119, 180),
           ),


            //task name
             Text(taskName,
             style: TextStyle(
              decoration: 
              taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
             ),),
             
          ],
        ),
       ),
      ),
    );
  }
}