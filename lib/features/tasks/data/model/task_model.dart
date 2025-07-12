import 'dart:convert';

class TaskModel {
  final int id;
  final String title;
  final bool completed;
  final int userId;

  const TaskModel({
    required this.id,
    required this.title,
    required this.completed,
    required this.userId,
  });

  TaskModel copyWith({int? id, String? title, bool? completed, int? userId}) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'completed': completed,
      'userId': userId,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
      userId: map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, completed: $completed, userId: $userId)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.completed == completed &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ completed.hashCode ^ userId.hashCode;
  }
}
