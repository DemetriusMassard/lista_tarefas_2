class Task {
  bool ok;
  String taskName;

  Task({required this.taskName, this.ok = false});

  Map<String, dynamic> toMap() {
    return {"taskName": taskName, "ok": ok};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(taskName: map['taskName'], ok: map['ok']);
  }

  @override
  String toString() {
    return "Task(taskName: $taskName, ok: $ok)";
  
  

  }
}