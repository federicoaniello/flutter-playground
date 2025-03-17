import 'dart:convert';

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('userId') &&
        json.containsKey('id') &&
        json.containsKey('title') &&
        json.containsKey('completed')) {
      return Todo(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        completed: json['completed'] as bool,
      );
    } else {
      throw const FormatException('Formato JSON non valido.');
    }
  }

  static List<Todo> fromJsonList(String jsonList) {
    final List<dynamic> decoded = jsonDecode(jsonList);
    return decoded
        .map<Todo>((json) => Todo.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
