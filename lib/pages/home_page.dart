import 'package:flutter/material.dart';
import 'package:todo_app/util/to_do_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249,225,224),
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 254,173,185),
      title: Text("TO DO LIST"),
      elevation: 0,),
      body: ListView(
        children: [
          ToDoTile(
          taskName: "touch grass",
          taskCompleted: false,
          onChanged: (p0) {},
          ),
          //task2
           ToDoTile(
          taskName: "kiss bf",
          taskCompleted: false,
          onChanged: (p0) {},
          ),
        ToDoTile(
          taskName: "fix sleep",
          taskCompleted: false,
          onChanged: (p0) {},
          ),
           ToDoTile(
          taskName: "bedrot",
          taskCompleted: true,
          onChanged: (p0) {},
          ),
        ],
      ),
    );
  }
}