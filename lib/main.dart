import 'package:flutter/material.dart';
import 'package:lista_tarefas_2/app/data/tasklist_data.dart';
import 'package:lista_tarefas_2/app/myapp.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  TaskData taskData = TaskData();
  await (taskData.readData());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return taskData;
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}
