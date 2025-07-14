import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {

  List toDoList = [];
final _myBox = Hive.box('myBox');


//run this if first time opening app
void createInitialData(){
  toDoList = [
  ["Make tut",false],
   ["do ex tut",false],
  ];
}

//load data from database

void loaddata(){
  toDoList = _myBox.get("todolist");
}


//update database
void updatedata() {
_myBox.put("todolist" , toDoList );
}

}