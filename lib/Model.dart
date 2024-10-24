// To parse this JSON data, do
//
//     final newsmodelapi = newsmodelapiFromJson(jsonString);

import 'dart:convert';

Newsmodelapi newsmodelapiFromJson(String str) => Newsmodelapi.fromJson(json.decode(str));



class Newsmodelapi {
    List<Todo> todos;

    Newsmodelapi({
        required this.todos,
    });

    factory Newsmodelapi.fromJson(Map<String, dynamic> json) => Newsmodelapi(
        todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
    );

  
}

class Todo {
    int id;
    String todo;
    bool completed;
    int userId;

    Todo({
        required this.id,
        required this.todo,
        required this.completed,
        required this.userId,
    });

    factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
    };
}
