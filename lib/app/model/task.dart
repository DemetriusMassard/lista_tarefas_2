class Task {
  bool ok;
  String taskName;

  Task({required this.taskName, this.ok = false});

  Map<String, dynamic> toJson() {
    return {"taskName": taskName, "ok": ok};
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(taskName: map['taskName'], ok: bool.parse(map['ok']));
  }

  @override
  String toString() {
    return "Task(taskName: $taskName, ok: $ok)";
  }
}
