import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapptutorial_20240905/constants/colors.dart';
import 'package:todoapptutorial_20240905/model/todo.dart';

class TodoItem extends StatelessWidget {

  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;
  const TodoItem({super.key, required this.todo, this.onToDoChange, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: (){
          onToDoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box:Icons.check_box_outline_blank,
          color: tdBlue,),
        title:  Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 15,
              color: tdBlack,
              decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: (){
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
