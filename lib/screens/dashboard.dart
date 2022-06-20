import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_flutter/database.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleCtr = TextEditingController();
    TextEditingController descriptionCtr = TextEditingController();
    TextEditingController dateCtr = TextEditingController();

    void _updateItem(Map data) {
      titleCtr.text = data['title'];
      descriptionCtr.text = data['description'];
      dateCtr.text = data['date'];
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Upate'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleCtr,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: descriptionCtr,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 10)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: dateCtr,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
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
                              Database.updateItem(
                                  title: titleCtr.text,
                                  description: descriptionCtr.text,
                                  date: dateCtr.text,
                                  idVal: data['docId']);
                              Navigator.pop(context);
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
              ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Duty Manager'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: StreamBuilder<QuerySnapshot>(
          stream: Database.readItems(),
          builder: ((BuildContext context,
              AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            } else if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Container(
                    color: Colors.grey[60],
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        ListTile(
                          title: Text(
                            data['title'],
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            children: [
                              Text('${data['description']}'),
                              Text("${data['date']}")
                            ],
                          ),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        _updateItem(data);
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.grey,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Database.deleteItem(
                                            docId: data['docId']);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.grey,
                                      ))
                                ]),
                          ),
                        )
                      ]),
                    )),
                  );
                }).toList(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTask');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Duty Manager'),
  //       centerTitle: true,
  //     ),
  //     backgroundColor: Colors.grey,
  //     body: Padding(
  //       padding: const EdgeInsets.all(30),
  //       child: Column(children: [card()]),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         Navigator.pushNamed(context, '/addTask');
  //       },
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }
}
