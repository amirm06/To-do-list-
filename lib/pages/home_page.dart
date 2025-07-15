import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialogBox.dart';
import 'package:todo_app/util/to_do_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//reference the box
final _mybox = Hive.box('mybox');

//controller
final _controller = TextEditingController();

//list of to tasks
ToDoDatabase db = ToDoDatabase();

@override
  void initState() {
    // if first time opening app
    if (_mybox.get("todolist")== null){
      db.createInitialData();
    } else {
      db.loaddata();
    }

    super.initState();
  }
//checkbox changed
void checkBoxChanged(bool? value, int index){
  setState(() {
    db.toDoList[index][1] = !db.toDoList[index][1];
  });
db.updatedata();
}
    //save new task
    void saveNewTask(){
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
        Navigator.of(context).pop();
      });
      db.updatedata();
    }

    //create new task
void createNewTask(){
    showDialog(context: context, 
    builder: (context) {
      return Dialogbox(
        controller: _controller ,
         onSave: saveNewTask ,
        onCancel: ()=> Navigator.of(context).pop() ,
       
      );
    },
    );
    db.updatedata();
  }

  //delete function
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  @override 
  Widget build(BuildContext context) {
    
    return Scaffold(
      
       appBar:
       AppBar(
         title: Text("TO DO LIST"),
        backgroundColor: Colors.transparent,
        elevation: 0,
       flexibleSpace: Image.asset(
        
       'assets/images/appbar3.jpg', 
       // Your cute image
       fit: BoxFit.cover,
       ),
       
     ),

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/images/other.jpg"),
             // 🍓 Add your image
            fit: BoxFit.cover,
            
        ) ,
  
    

   



      ),
       child: ListView.builder(
       itemCount: db.toDoList.length,
       itemBuilder:(context, index) {
         return ToDoTile(onChanged:  (value) => checkBoxChanged(value,index),
          taskCompleted:  db.toDoList[index][1],
           taskName: db.toDoList[index][0],
           deleteFunction: (context)=> deleteTask(index),
           );
       },
      ),
      ),
       //Floating button
    floatingActionButton: FloatingActionButton(
      onPressed: createNewTask ,
     child: Icon(Icons.add),
   ),
    
    );
    
  }
}