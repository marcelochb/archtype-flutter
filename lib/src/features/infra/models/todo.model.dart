import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TodoModel extends ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final bool done;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.done,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? done,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      done: done ?? this.done,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'done': done,
    };
  }

  FormGroup toFormGroup() {
    return FormGroup({
      'id': FormControl<String>(value: id),
      'title': FormControl<String>(value: title),
      'description': FormControl<String>(value: description),
      'done': FormControl<bool>(value: done),
    });
  }

  bool get isValid {
    return toFormGroup().valid;
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      done: map['done'],
    );
  }
}