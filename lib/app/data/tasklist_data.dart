import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [];

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> saveFile() async {
    String data = json.encode(taskList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<void> readData() async {
    try {
      final file = await _getFile();
      List<dynamic> data = json.decode(await file.readAsString());
      taskList = [];
      for (var task in data) {
        Task newTask = Task(taskName: task['taskName'], ok: task['ok']);
        taskList.add(newTask);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
