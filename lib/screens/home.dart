import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapptutorial_20240905/constants/colors.dart';
import 'package:todoapptutorial_20240905/model/todo.dart';
import 'package:todoapptutorial_20240905/widgets/todo_item.dart';


class Home extends StatefulWidget {
  Home({super.key, required String title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todolist = ToDo.todoList();
  List <ToDo> _foundToDo =[];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todolist;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50,bottom: 20),
                        child: const Text('All To Dos',
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),
                        ),
                      ),
                      for ( ToDo todoo in _foundToDo.reversed)
                      TodoItem(todo: todoo ,
                        onDeleteItem: _deleteToDoItems,
                        onToDoChange: _handleToDoChanges,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration:  BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 0.0),
                      spreadRadius: 0.0,
                    )],
                    borderRadius: BorderRadius.circular(5),
                    ),
                      child: TextField(
                        controller: _todoController,
                        decoration: const InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none,
                        ),
                      ),
                ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20,right:20),
                  child: ElevatedButton(
                    onPressed: (){
                      _addToDoItems(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text('+',style: TextStyle(fontSize: 40,color: Colors.white),),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  void _handleToDoChanges(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
  void _deleteToDoItems(String id){
    setState(() {
      todolist.removeWhere((item)=> item.id == id);
    });
  }
  void _addToDoItems(String toDo){
    setState(() {
      todolist.add(
          ToDo(id: DateTime.now().millisecond.toString(),
              todoText: toDo));
    });
    _todoController.clear();
  }
  void _runFilter (String enteredKeyword) {
    List <ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todolist;
    } else{
      results = todolist
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo =results;
    });
  }

  Widget searchBox() {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            child:  TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: tdBlack,
                    size: 20,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    minWidth: 25,
                  ),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white)),
            ),
          );
  }

  AppBar _buildAppBar() {
    return  AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Icon(Icons.menu,color: tdBlack,size: 30),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            child: Image.asset('asssets/images/profile-pic.png'),
          ),
        )
      ]),
    );
  }
}
