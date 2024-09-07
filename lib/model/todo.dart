class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id:'01',todoText:'123435', isDone:true),
      ToDo(id:'02',todoText:'1ádfasf',),
      ToDo(id:'03',todoText:'agagaga', isDone:true),
      ToDo(id:'04',todoText:'ádfasfff',),
      ToDo(id:'05',todoText:'nnnnnnnn',),
    ];
}
}
