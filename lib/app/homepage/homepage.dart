import 'package:flutter/material.dart';
import 'package:lista_tarefas_2/app/data/tasklist_data.dart';
import 'package:provider/provider.dart';

import '../model/task.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController taskController = TextEditingController();
  List<Task> _taskList = [];

  void _addTask(String taskName) {
    setState(() {
      Task newtask = Task(taskName: taskName);
      _taskList.add(newtask);
    });
  }

  @override
  Widget build(BuildContext context) {
    TaskData taskData = Provider.of<TaskData>(context);
    _taskList = taskData.taskList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      labelText: "Nova tarefa",
                      labelStyle: TextStyle(color: Colors.cyan),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addTask(taskController.text);
                    taskData.saveFile();
                  },
                  child: Text("Adicionar"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 16),
                itemCount: _taskList.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_taskList[index].taskName),
                    value: _taskList[index].ok,
                    onChanged: (c) {
                      setState(() {
                        _taskList[index].ok = c!;
                        taskData.saveFile();
                      });
                    },
                    secondary: CircleAvatar(
                      child: Icon(
                        _taskList[index].ok ? Icons.check : Icons.error,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
