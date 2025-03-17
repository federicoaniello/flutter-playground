import 'package:flutter/material.dart';
import 'package:playground/api/todos_api.dart';
import 'package:playground/models/todos_response.dart';
import 'package:playground/widgets/container_widget.dart';

class TodosWidget extends StatefulWidget {
  const TodosWidget({super.key});

  @override
  State<TodosWidget> createState() => _TodosWidgetState();
}

class _TodosWidgetState extends State<TodosWidget> {
  late Future<List<Todo>> todos;

  @override
  void initState() {
    super.initState();
    todos = fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: FutureBuilder<List<Todo>>(future: todos, builder: (context, snapshot) {
        if(snapshot.hasData){
          return Column(
            children: [
              for (var todo in snapshot.data!)
                ContainerWidget(title: todo.title, description: todo.title),
            ],
          );
        }
        else if(snapshot.hasError){
          return Text('Uh oh!');
        } else {
          return CircularProgressIndicator();
        }
      },),
    );
  }
}