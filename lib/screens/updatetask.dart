import 'package:fire_flutter/database.dart';
import 'package:flutter/material.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({Key? key}) : super(key: key);

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future _updateItem() {
    final title = titleController.text;
    final desc = descriptionController.text;
    final date = dateController.text;

    return Database.updateItem(title: title, description: desc, date: date );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Title'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date',
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
                      _updateItem();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Update Task',
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
