import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [];

  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> saveFile() async {
    String data = json.encode(taskList);
    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String?> _readData() async {
    try {
      final file = await getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
