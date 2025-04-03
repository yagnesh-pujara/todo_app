import 'dart:convert';
import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  String todoTitle;

  TodoModel({required this.todoTitle});

  factory TodoModel.fromRawJson(String str) =>
      TodoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      TodoModel(todoTitle: json["todoTitle"]);

  Map<String, dynamic> toJson() => {"todoTitle": todoTitle};
}
