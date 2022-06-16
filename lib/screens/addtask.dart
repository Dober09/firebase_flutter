import 'package:fire_flutter/database.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future _addTask() {
    final title = titleController.text;
    final desc = descriptionController.text;
    final date = dateController.text;

    return Database.addItems(title: title, description: desc, date: date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 10)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date',
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 500,
                height: 50,
                child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 70, 69, 68))),
                    onPressed: () {
                      _addTask();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Add Task',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
